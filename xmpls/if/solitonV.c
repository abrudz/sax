/* solitonV.c - Copyright (c) 1994, Soliton Associates Limited */

#ifndef lint
static char sccsid[]="@(#)solitonV.c	1.1 94/03/11";
#endif

/* solitonV.c - Copyright (c) 1994, Soliton Associates Limited */

#ifndef lint
static char sccsid[]="@(#)solitonV.c	1.2 94/03/07";
#endif

/*		Generic   version   function code.
 *
 *  Version intrinsic.   Can be included in source for an intrinsic library
 *  to provide a function which returns version information.
 *
 *  Before including this document, the following #defines should be made:
 *	F   -  Name of function to create, eg "version"
 *	V   -  Version information, eg "Version 1.0"
 *	N   -  Name of product, eg "Foobar Interface"
 *	R   -  Release level, eg "Production Release"
 *	D   -  Date, eg "1994-01-15"
 *      C   -  Copyright, eg "Copyright 1994, Gonzo Software"
 *	X   -  Other information, eg "Patch level 2"   [Optional]
 *
 *  The function created takes a single integer, and returns a character
 * pointer aiming at a string containing specific version information.
 *  version:	version(0)  <-->   "Version 1.0"
 *  name:	version(1)  <-->   "Foobar Interface"
 *  release:	version(2)  <-->   "Production Release"
 *  date:	version(3)  <-->   "1994-01-15"
 *  copyright:	version(4)  <-->   "Copyright 1994, Gonzo Software"
 *  extended:	version(5)  <-->   "Patch level 2"
 *  list form:  version(6)  <-->   "Version 1.0\n
 *				    Foobar Interface\n
 *				    Production Release\n
 *				    1994-01-15\n
 *				    Copyright 1994, Gonzo Software\n
 *				    Patch level 2\n"
 * formatted:	version(7)  <-->   "Foobar Interface, Version 1.0\n
 *				    Production Release, 1994-01-15\n
 *				    Copyright 1994, Gonzo Software\n
 *				    Patch level 2"
 *
 *   version(x) for any other x returns "7", the highest permissible argument.
 *
 */

#define NL strcat(buf,"\n")
#define COM strcat(buf,", ")
#define ZZ(x) strcpy(buf,x)
#define Z(x) strcat(buf,x)

#include <string.h>


char *F(x)
{
 static char buf[1024];
 switch(x){
	case 0: return V;   case 1: return N;   case 2: return R;
	case 3: return D;   case 4: return C;
#ifdef X
	case 5: return X;
	case 6: ZZ(V);NL;Z(N);NL;Z(R);NL;Z(D);NL;Z(C);NL;Z(X);NL;
		return buf;
	case 7: ZZ(N);COM;Z(V);NL;Z(R);COM;Z(D);NL;Z(C);NL;Z(X);
		return buf;
#else
	case 5: return "";
	case 6: ZZ(V);NL;Z(N);NL;Z(R);NL;Z(D);NL;Z(C);NL;NL;
		return buf;
	case 7: ZZ(N);COM;Z(V);NL;Z(R);COM;Z(D);NL;Z(C);
		return buf;
#endif
	default:return "7";
	  }
}

