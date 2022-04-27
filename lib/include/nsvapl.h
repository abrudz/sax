/* nsvapl.h - Copyright (c) 1994, Soliton Associates Limited */


/*
$Header: /usr/cvsroot/sax/src/nsvp/nsvapl.H,v 1.2 1999/06/14 17:48:17 lbossis Exp $
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



#ifndef _NSVAPL_H_
#define _NSVAPL_H_
/* This file defines
   simple APL objects
*/
enum nsv_apl_type_e {
		NSV_APL_CHAR = 0,
		NSV_APL_BOOL = 1,
		NSV_APL_INT = 2,
		NSV_APL_FLOAT = 3,
		NSV_APL_PTR = 4,
		    };
typedef struct nsv_apl {
	char nsva_fill[2]; 	/* 2 bytes filler */
	char nsva_type;		/* apl data type */
	char nsva_rank;		/* rank */
	int  nsva_nelm;		/* number of elements */
	union {
		int  nsva_shape[1]; 	/* shape vector */
		char nsva_data[1]; 	/* data */
		int  nsva_tlength; 	/* trailing length */
	       } nsva_body;
		} nsv_apl_t;

/* Note data is double-word aligned with respect to start of
   structure (i.e. there may be a word of filler after shape */

typedef struct nsv_ptr_apl {
	int  nsva_length;
	int  nsva_refcount;
	nsv_apl_t nsva_ptr_body;
	} nsv_ptr_apl_t;

/* In the following m is a pointer to an nsv_apl structure
   while p is a pointer to an nsv_ptr_apl structure */

#define nsv_length(p) ((p)->nsva_length)
#define nsv_refcount(p) ((p)->nsva_refcount)

#define nsv_type(m)  ((m)->nsva_type)
#define nsv_rank(m)  ((int ) (m)->nsva_rank)
#define nsv_nelm(m)  ((int ) (m)->nsva_nelm)
#define nsv_shape(m)  ((m)->nsva_body.nsva_shape)
#define nsv_data(m)  ((m)->nsva_body.nsva_data 			    + 8*((nsv_rank(m) + 1)/2))

#define nsv_tlength(p) (*(((int  *) 			    ((char *)(p) + nsv_length(p))) - 1))
#endif    /*  _NSVAPL_H_  */
