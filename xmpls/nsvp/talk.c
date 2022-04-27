/* 

			Test program for NSVP API

	This program:

	- if requested, initiates an s-task on the destination machine
	  and gets it to load a specified workspace
	  (an empty workspace name indicates no s-task should be started;
	  instead it is assumed the server task already exists);
	- shares a variable with the server task (whether the s-task or
	  an existing server task);
	- repeatedly sends a transaction (a character vector) via 
	  the variable, and receives and displays a reply (assumed to 
	  be a character vector also);

	Example use: 

	talk clientid clientpass 101 999 machine@405 
			serverid serverpass 124 9999 serverws
									*/

#include <stdio.h>
#include <signal.h>
#include <setjmp.h>
#include <sys/time.h>
#include <unistd.h>
#include <nsvapl.h>
#include <nsvtcp.h>
#include <nsv.h>

#define APL_HDR_LEN sizeof(nsv_apl_t)+4

typedef struct Nsv_struct	/* control block per offer */
{
	nsv_anchor *anca;	/* ptr to signon anchor block */
	nsv_scv_t scv;		/* nsv_scv for this offer */

	/* apl, len, use_set, doc are set by nsv_get;
	   len is used by nsv_put					*/

	nsv_apl_t *apl;		/* addr. of incoming value */
	long len;		/* incoming value's length */
	long use_set;		/* set if there is incoming value */
	long doc;		/* deg. of coup. */

	nsv_apl_t *bufina;	/* our input buffer address */
	long bufinl;		/* out input buffer length */
	nsv_apl_t *bufouta;	/* our output buffer address */
} Nsv;

typedef struct Arg_struct	/* program's input arguments */
{
	char *client_name;	/* client's id, password, procid, cloneid */
	char *client_passwd;
	long client_pid;
	long client_cid;

	char *carr;		/* target machine name and port no. */

	char *server_name;	/* server's id, password, procid, cloneid */
	char *server_passwd;
	long server_pid;
	long server_cid;

	char *server_wsname;	/* workspace for server to load */
} Arg;

void Nsv_sethdr();
static void handler();

int signal_flag = 0;
sigjmp_buf jmp_env;

/*	main:

	Main program, given input arguments in the same order 
	as in Arg_struct 						*/

void
main (argc, argv)
int argc;
char *argv[];
{

Arg args;
nsv_pcv_t my_pcv;
nsv_carrinfo_t my_carr;
nsv_cnfg_t my_cnfg;
nsv_anchor anc;
Nsv *my_nsva;
int len, rc;

#define bufsize 1000
struct {
	nsv_apl_t hdr;
	char data[bufsize+4];
	} my_apl;	/* APL objects, in and out, built here */

char inbuf[bufsize];
int insize;

signal(SIGINT, handler);

printf("\n");

/*	process command arguments into args structure	*/

if (0 != (rc = argvinit(argc, argv, &args))) exit(rc);

/*	set up pcv, cnfg, carr for nsv_signon		*/

my_pcv.name = args.client_name;
my_pcv.passwd = args.client_passwd;
my_pcv.procid = args.client_pid;
my_pcv.cloneid = args.client_cid;
my_pcv.flags = 0;

my_cnfg.nshr = 10;
my_cnfg.mvsize = 10000;
my_cnfg.debug = 0;

my_carr.carr_str = args.carr;

/*	sign on as client to destination machine			*/

if (NSV_OK != (rc = nsv_signon(&my_pcv, &my_cnfg, &my_carr, &anc))) {
	printf("Signon failed:%d\n", rc);
	exit(rc);
	}

/*	if asked to do so, start an stask as server on destination 
	machine, specifying workspace to load. (The server may
	already be started some other way, in which case, this is 
	skipped)							*/

if (*args.server_wsname != '\0')	/* empty ws-name means 'no stask' */
	if (NSV_OK != (rc = Start_stask(&anc, 101, args.server_name, 
				args.server_passwd, args.server_wsname))) {
		printf("Start_stask failed:%d\n", rc);
		exit(rc);
		}

/*	set up Nsv structure for Nsv_offer				*/

my_nsva = (Nsv *) malloc(sizeof(Nsv));
my_nsva->scv.name = "ctl";
my_nsva->scv.procid = args.server_pid;
my_nsva->scv.cloneid = args.server_cid;
my_nsva->scv.mypsx = 99;
my_nsva->bufina = &my_apl.hdr;
my_nsva->bufinl = APL_HDR_LEN + bufsize;
my_nsva->bufouta = &my_apl.hdr;
my_nsva->anca = &anc;

/*	offer variable to stask server					*/

if (NSV_OK != (rc = Nsv_offer(my_nsva))) {
	printf("Offer failed:%d\n", rc);
	exit(rc);
       }

/*	repeatedly send transaction to server and receive response	*/

while (my_nsva->doc != NSV_RETR) {

	printf("\nEnter character string:\n");

/*	build character vector for Nsv_put				*/

	if (0 > (insize = read(STDIN_FILENO, inbuf, bufsize))) {
		printf("Input read failure: %d\n", insize);
		exit(insize);
		}
	insize--;	/* drop trailing CR */
	if (1 > insize) break;	/* naked CR ends conversation */

	printf("\n");
	Nsv_sethdr(my_nsva, NSV_APL_CHAR, 1, &insize);
	memcpy(nsv_data(my_nsva->bufouta), inbuf, insize);

/*	send APL object to server and get response			*/

	if (NSV_OK != (rc = Nsv_putget(my_nsva))) {
		switch (rc) {
			case(-1): printf("Transaction interrupted\n"); break;
			case(-2): printf("Response too large\n"); continue;
			default: printf("Error in Nsv_putget:%d\n", rc);
			}
		exit(rc);
	       }

/*	check type and rank of response					*/

	if (NSV_APL_CHAR != *(int *)(nsv_type(my_nsva->bufina))) {
		printf("Bad response type\n");
		continue;
	       }
	if (1 != *(int *)(nsv_rank(my_nsva->bufina))) {
		printf("Bad response rank\n");
		continue;
	       }

/*	display response						*/

	*(((char *) my_nsva->bufina)+my_nsva->len) = '\0'; 
							/* terminate string */
	printf("Response is:\n\n%s\n", (char *) nsv_data(my_nsva->bufina));
	}

/*	terminate conversation and sign off
	(it is assumed the stask will terminate itself, or
	will end as a result of implicit variable retraction when
	this process ends						*/

printf("Ending conversation\n\n");

if (NSV_OK != (rc = Nsv_retract(my_nsva))) {
	printf("Retract failed:%d\n", rc);
       }

if (NSV_OK != (rc = nsv_signoff(&anc))) printf("Signoff failed:%d\n", rc);

exit(rc);
}

/*	handler:

	Signal handling routine: handles interrupt in nsv_state		*/

static void
handler (sig)
int sig;
{
if (signal_flag) {
	signal_flag = 0;	/* disarm the jump */
	siglongjmp(jmp_env, 1);	/* jump to recovery code */
	}
}

/*	argvinit:

	arrange input arguments in argument control block		*/

int 
argvinit(argc, argv, argsa)
int argc;
char *argv[];
Arg *argsa;
{
int rc;
char *p;
long nn;

if (argc < 11) {
	printf("Not enough arguments\n");
	return(1);
	}

/*	client name, password, procid and cloneid			*/

argsa->client_name = argv[1];
argsa->client_passwd = argv[2];

p = argv[3];
if(1 != sscanf(p, "%ld", &nn)) {
	printf("Bad arg: %s\n", argv[3]);
	return(1);
	}
argsa->client_pid = nn;

p = argv[4];
if(1 != sscanf(p, "%ld", &nn)) {
	printf("Bad arg: %s\n", argv[4]);
	return(1);
	}
argsa->client_cid = nn;

/*	NSVP machine name and port number				*/

argsa->carr = argv[5];

/*	server name (or acct. no), password, procid and cloneid		*/

argsa->server_name = argv[6];
argsa->server_passwd = argv[7];

p = argv[8];
if(1 != sscanf(p, "%ld", &nn)) {
	printf("Bad arg: %s\n", argv[8]);
	return(1);
	}
argsa->server_pid = nn;

p = argv[9];
if(1 != sscanf(p, "%ld", &nn)) {
	printf("Bad arg: %s\n", argv[9]);
	return(1);
	}
argsa->server_cid = nn;

/*	workspace for server to load					*/

argsa->server_wsname = argv[10];

return(0);
}

/*	Nsv_offer:

	Offer a particular shared variable				*/

int
Nsv_offer(nsva)
Nsv *nsva;
{
return(nsv_offer(&nsva->scv, &nsva->doc, nsva->anca));
}

/*	Nsv_retract:

	Retract a particular shared variable				*/

int
Nsv_retract(nsva)
Nsv *nsva;
{
return(nsv_retract(nsva->scv.hispsx, nsva->anca));
}

/*	Nsv_sethdr:

	build the APL object header for shared variable, and
	set the length for Nsv_put					*/

void
Nsv_sethdr(nsva, type, rank, shape)
Nsv *nsva;
char type;
char rank;
long *shape;
{
long *p;
long i, n;

/*	set type and rank						*/

*(int *)(nsv_type(nsva->bufouta)) = type;
*(int *)(nsv_rank(nsva->bufouta)) = rank;

/*	copy shape vector and compute total number of elements		*/

n = 1;
p = (long *) nsv_shape(nsva->bufouta);

for (i = 0 ; i < rank ; i++) {
	*p++ = shape[i];
	n *= shape[i];
	}

*(int *)(nsv_nelm(nsva->bufouta)) = n;	/* total no. of elements */

/*	calculate, and set, total length of object			*/

switch (type) {
	NSV_APL_BOOL: n = n / 8; break;
	NSV_APL_INT:
	NSV_APL_PTR: n *= 4; break;
	NSV_APL_FLOAT: n *= 8; break;
	NSV_APL_CHAR: ;
	}
nsva->len = APL_HDR_LEN + n;	/* total length for Nsv_put */

}

/*	Nsv_put:

	Set (i.e. send) a value for a particular shared variable	*/

int
Nsv_put(nsva)
Nsv *nsva;
{
return(nsv_set(nsva->scv.hispsx, nsva->bufouta, nsva->len, nsva->anca));
}

/*	Nsv_get:

	Wait for and get the next incoming value for a particular
	shared variable							*/

int
Nsv_get(nsva)
Nsv *nsva;
{
int psx, rc;

/*	prepare for interruption out of wait in Nsv_state		*/

if (0 != sigsetjmp(jmp_env, 0)) return(-1);	/* return from signal */
signal_flag = 1;	/* arm the jump */

/*	Repeatedly wait for state change until use_set indicates
	there is an incoming value (or partner retracts share)		*/

nsva->use_set = 0;	/* initial value */
while (nsva->doc != NSV_RETR && nsva->use_set != NSV_USE) {
	if (NSV_OK != (rc = nsv_state(0, nsva->scv.hispsx, &psx, &nsva->doc, 
		&nsva->use_set, &nsva->apl, &nsva->len, 
		nsva->anca))) return(rc);

	if (psx != nsva->scv.mypsx) return(-3);
					/* wrong psx; shouldn't happen */
	}

if (nsva->use_set != NSV_USE) return(0);  /* partner must have retracted */

/*	Move the object to our buffer (from API's buffer), if 
	there is room, and indicate to API his buffer is clear		*/

if (nsva->bufina!= NULL) {
	if (nsva->bufinl < nsva->len) return(-2);	/* object is too big */
	memcpy(nsva->bufina, nsva->apl, nsva->len);
	}
rc = nsv_use(nsva->scv.hispsx, nsva->anca);	/* aknowledge use */
signal_flag = 0;	/* unarm the jump */

}

/*	Nsv_putget:

	Send a value for a particular shared variable, then wait for
	and receive a reply						*/

int
Nsv_putget(nsva)
Nsv *nsva;
{
int rc;

/*	send an object to partner					*/

	if (NSV_OK != (rc = Nsv_put(nsva))) return(rc);

/*	get response from partner 					*/

	return(Nsv_get(nsva));
}

/*	Start_stask:

	Start an s-stask on destination system, using an existing
	SV signon, given optional id/password. Also, optionally get
	that s-task to load a specified workspace			*/

int 
Start_stask(anca, mypsx, name, passwd, wsname)
nsv_anchor *anca;
int mypsx;
char *name, *passwd, *wsname;
{

Nsv my_nsv;
int rc, wsname_size, data_size;
struct {
	nsv_apl_t hdr;
	char data[250];
	} apl_inp;	/* place to build APL object to send to s-task */

/*	Initialise an scv for a variable to share with AP 1		*/

my_nsv.scv.name = "apl";
my_nsv.scv.procid = 1;
my_nsv.scv.cloneid = 0;
my_nsv.scv.mypsx = mypsx;	/* must specify unique no. for this variable */

my_nsv.bufina = NULL;		/* we ignore responses from s-task */
my_nsv.bufinl = 0;		/* we ignore responses from s-task */
my_nsv.bufouta = &apl_inp.hdr;	/* input to s-task built here */
my_nsv.anca = anca;		/* tie it to particular signon */

/*	Offer the variable to AP 1					*/

if (NSV_OK != (rc = Nsv_offer(&my_nsv))) {
	printf("Error starting stask (Nsv_offer): %d\n", rc);
	return(rc);
	}

/*	If an id is specified, send an APL signon to the s-task
	(mainframe APL needs one, UNIX APL does not			*/

if (*name != '\0') { char *p; int sz;	/* empty id means do not send signon */

/*	Construct the signon: e.g. )1234567:password			*/

	data_size = 6+strlen(name)+strlen(passwd);	/* total length */
	Nsv_sethdr(&my_nsv, NSV_APL_CHAR, 1, &data_size);
	p = (void *)nsv_data(my_nsv.bufouta);
	memcpy(p, "\0\0\0\0)", 5); p += 5;	/* s-task header + ')' */
	sz = strlen(name);
	memcpy(p, name, sz); p += sz;		/* id */
	*p++ = ':';
	memcpy(p, passwd, strlen(passwd));	/* password */

/*	Send signon to s-task						*/

	if (NSV_OK != (rc = Nsv_put(&my_nsv))) {
		printf("Error starting stask (Nsv_put): %d\n", rc);
		return(rc);
		}
	}

/*	Wait for output from s-task. We ignore it, but it seems to be
	wise to wait for it before sending anything			*/

if (NSV_OK != (rc = Nsv_get(&my_nsv))) {
	printf("Error starting stask (Nsv_get): %d\n", rc);
	return(rc);
	}

/*	Nsv_get may have detected retraction (i.e. death of S-task)	*/

if (my_nsv.doc == NSV_RETR) return(1);

printf("S-task started\n");

/*	Send a )load command to s-task, presumably to start a server
	program								*/

wsname_size = strlen(wsname);
data_size = 10+wsname_size;	/* total length of character vector */
Nsv_sethdr(&my_nsv, NSV_APL_CHAR, 1, &data_size);
memcpy(nsv_data(my_nsv.bufouta),"\0\0\0\0)load ", 10);
						/* s-task header + )load */
memcpy(nsv_data(my_nsv.bufouta)+10, wsname, wsname_size);	/* ws-name */

/*	Send command to s-task						*/

if (NSV_OK != (rc = Nsv_put(&my_nsv))) printf("Bad stask set:%d\n", rc);
return(rc);
}

