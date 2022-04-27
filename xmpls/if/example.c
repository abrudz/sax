/* example.c - Copyright (c) 1994, Soliton Associates Limited */

#ifndef lint
static char sccsid[]="@(#)example.c	1.1 94/03/11";
#endif

/*
 *		Example intrinsic
 *
 *   Give access to the following functions:
 *     version()	defined in exampleV.c
 *     noop()		defined below
 *     adder()		function to sum a list of integers
 *     uid2name()	return user id given name
 *     name2uid()	return name given user id
 *     gettimeofday()	gettimeofday system call
 *     strcmp()		strcmp C library function
 */


#include <sys/types.h>
#include <sys/time.h>
#include <pwd.h>
#include <string.h>

char *version();


/*
 *  No-op function.   Call this to ensure the dynamically loadable .si file
 *  can be loaded, and before attaching a debugger to the APL process when
 *  debugging user-written intrinsics.
 */
int noop() {return 0;}



/*
 *  Function to add a list of integers.  Given length of list (len) and
 *  a pointer to the integers (nums).
 */
int adder(len, nums)
int len,*nums;
{
 int total=0;

 while(len--)
	total+=*nums++;

 return total;
}



char *uid2name(uid)
int uid;
{
 struct passwd *p;

 p=getpwuid(uid);
 return p?p->pw_name:"";
}


int name2uid(name)
char *name;
{
 struct passwd *p;

 p=getpwnam(name);

 return p?p->pw_uid:-1;
}

 



#include "example.stub"
