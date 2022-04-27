/* nsv.h - Copyright (c) 1994, Soliton Associates Limited */


/*
$Header: /usr/cvsroot/sax/src/nsvp/nsv.H,v 1.2 1999/06/14 17:48:17 lbossis Exp $
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



#ifndef _NSV_H_
#define _NSV_H_

/* 
   This file defines
   a) headers for nsvapi function calls and related structures
   b) error codes returned from those calls

   The compiler variable _NSV_H_ controls the expansion of this
   header file.
   Defined causes the expansion to be skipped.
   Undefined causes the file to be expanded, and the variable
   to be defined (to prevent a subsequent expansion if the file is
   included more than once).

   The compiler variable NSV_ANSIP controls the use of ANSI prototypes.
   Defined means "use ANSI prototypes (function declarations)
   Undefined means use K&R function declarations.
*/
typedef struct nsv_anc {
	nsv_carrier_t * carr;
	nsv_base_t * myob;
	} nsv_anc_t;

typedef nsv_anc_t * nsv_anchor;

enum nsv_pcv_flags_e {
	NSV_NOXLATE = 0x1,	/* No translation of character data */
	};

typedef struct nsv_pcv {
	char *name;
	char *passwd;
	int  procid;
	int  cloneid;
	int  flags;
	} nsv_pcv_t;

typedef struct nsv_cnfg {
	int  nshr; /* Maximum number of shared variables */
	int  mvsize; /* Maximum size of any one shared vble */
	int  debug; /* 0 if no debugging on stdout, else -1 */
	} nsv_cnfg_t;


typedef struct nsv_scv {
	char *name;
	int  procid;
	int  cloneid;
	int  mypsx;
	int  hispsx;

	} nsv_scv_t;

enum nsv_use_set_e {
	NSV_MT = 0x0,  /* User can write, nothing for him to read */
	NSV_USE = 0x1, /* There is a value for user to read */
	NSV_SET = 0x2, /* NSVP has not read user's value yet */
	       };

enum nsv_doc_e {
	NSV_RETR = 0, /* Retracted by partner */
	NSV_HALF = 1, /* Not yet accepted by partner */
	NSV_FULL = 2, /* Accepted by partner */
		};
enum nsv_rc_e {
	NSV_OK = 0, /* Normal end */
	NSV_NOF = 1, /* Nothing found or interupted wait */
	NSV_ARG = 2, /* Argument error */
	NSV_LRS = 3, /* Local resource shortage (malloc?) */
	NSV_RRS = 4, /* Remote resource shortage */
	NSV_UH = 5, /* At signon, unknown host */
	NSV_NIU = 6, /* At sign-on, number in use */
	NSV_FE = 7, /* Fatal error */
		};




#define __NSV__(x) int nsv_##x


__NSV__(signon) (
#ifdef NSV_ANSIP
	   nsv_pcv_t *, /* Process control vector */
	   nsv_cnfg_t *, /* api configuration parameters */
	   nsv_carrinfo_t *, /* Carrier dependent info */
	   nsv_anchor * /* ptr to ptr to primary ctl block */
#endif
	   );  

 
__NSV__(signoff) (
#ifdef NSV_ANSIP
	    nsv_anchor *  /* Ptr to primary ctl block */
#endif
	   ); 

__NSV__(offer) (
#ifdef NSV_ANSIP
	  nsv_scv_t *,	/* offer descriptor */ 
	  int *,        /* degree of coupling (1 or 2) */
	  nsv_anchor *	/* Ptr to primary ctl block */ 
#endif
	 ); 
 
__NSV__(retract) (
#ifdef NSV_ANSIP
	    int ,	/* hispsx */
	    nsv_anchor * /* Ptr to primary ctl block */ 
#endif
	   );
  
enum nsv_flags_e {
	NSV_NBLOCK = 0x1, /* Non-blocking wait */
		};

__NSV__(state) (
#ifdef NSV_ANSIP
	  int ,		/* Flags (WAIT? BLOCK?) */
	  int ,		/* hispsx  (or -1 ) */
	  int  *,	/* ptr to mypsx */
	  int  *,	/* Degree of coupling (0, 1, or 2) */
	  int  *,	/* use/set */
	  nsv_apl_t **,  /* ptr to value ptr */
	  int  *,        /* length of value */
	  nsv_anchor *	/* Ptr to primary ctl block */
#endif
	 );


__NSV__(update) (
#ifdef NSV_ANSIP
	  nsv_anchor *	/* Ptr to primary ctl block */
#endif
	 );




__NSV__(set) (
#ifdef NSV_ANSIP
	int ,	        /* hispsx */
	nsv_apl_t *,	        /* ptr to apl object */
	int ,	        /* length of value */
	nsv_anchor *	        /* Ptr to primary ctl block */
#endif
      );

__NSV__(use) (
#ifdef NSV_ANSIP
	int ,	/* hispsx */
	nsv_anchor *	/* Ptr to primary ctl block */
#endif
       );

#endif    /*  _NSV_H_  */
