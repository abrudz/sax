/* nsvtcp.h - Copyright (c) 1994, Soliton Associates Limited */


/*
$Header: /usr/cvsroot/sax/src/nsvp/nsvtcp.H,v 1.2 1999/06/14 17:48:17 lbossis Exp $
*/









/* to use C99 type of variadic macros or not */






/* Linux 2.x */
/* Sun SPARC RISC */
/* IBM RISC 6000 machines */
/* 16-bit Microsoft Windows */
/* 32-bit Microsoft Windows */
/* HP */
/* Solaris on Intel */











/* No file locking avail */
/* Use locking system call */
/* Use lock server */
/* Use flock() and shadow files */
/* Use lockf() system call  */
/* Use fcntl() system call  */

/* Byte order | 3 | 2 | 1 | 0 | 68000 */
/* Byte order | 0 | 1 | 2 | 3 | VAX/PC */

/* Use assembler sources */
/* Use c sources */

/* IEEE DOUBLE - RIGHT byte order */
/* IEEE DOUBLE - WRONG byte order */
/* VAX DOUBLE */
/* IBM/370 */

/* 8-bit extended ASCII */
/* EBCDIC */

/* Kernighan & Ritchie */
/* ANSI C */
/* C++ */

/* Windows-16, or PC Dos  */
/* Windows-32, and most everything else */





/* Same as IBM6K until otherwise discovered */




/* Intel Solaris */






/* Roland wants it this way. wru 16nov88 */






/* _SYSDIFF_H_ */



#ifndef _NSVTCP_H_
#define _NSVTCP_H_
/*
 *  To inhibit dummy definition of nsv_base_t, define
 *     NSVTCP_NOBASE  before including this file
 */
#ifdef NSV_ANSIP
#define NSV_PAT(x) x
#else 
#define NSV_PAT(x) ()
#endif
/*
 * Defines socket constants and prototypes for NSVP and the API
 */ 

#include <sys/socket.h>

/* SYSG == SYSGS5 */
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <netdb.h>
#define NSV_SOCKET int
#define NSV_INV_SOCKET -1
#define NSV_EWOULDBLOCK EWOULDBLOCK
#define NSV_ECONNRESET ECONNRESET
#define NSV_ENOBUFS ENOBUFS
#define NSV_ECONNREFUSED ECONNREFUSED
#define NSV_ETIMEDOUT ETIMEDOUT

typedef struct nsv_carrinfo {
        char * carr_str;                    /* system@port string  e.g
					       i6k@456 */
        } nsv_carrinfo_t;


typedef struct nsv_carrier {

	int fd;                     /* TCP/IP file descriptor otherwise */
	int getfl;                  /* fcntl flags at open time */

	nsv_carrinfo_t * carrinfo;  /* Pointer sign-on string */
	}  nsv_carrier_t;

#ifndef NSVTCP_NOBASE
typedef void nsv_base_t;

#endif   /*  ifndef NSVTCP_NOBASE   */ 
#endif  /*  _NSVTCP_H_  */
