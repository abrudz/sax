!   �   � d�%@{   !    ��~< � @09$@@    ��%@��%@T�%@@4@@        �%@����      0=
   ��%@    !           p$@    �   �A  ����            P�%@    �F$@��������       (�%@P   P�%@8G$@x�%@       f                                            �$@   0){h                          0*'    0*'                          0*'    0)yp           0           0#V       0* �                       0#4       0*��                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         X                   	 
                                X   (     !          ��      ��$@X�$@��     09$@�;$@       ��$@           ��$@           0�$@           ��$@           ��$@           @�$@            �$@           ��$@    	       ��$@    
       H�$@           0�$@           �$@           ��$@           h�$@           P�$@           8�$@           ��$@           ��$@           x�$@           X�$@            �$@           ��$@           ��$@           ��$@           ��$@           ��$@           0�$@           �$@           ��$@           ��$@                    (  0              2 3 4 5 ; 7 8 ��9      0                       P                   	 
                           P   �               ��       �$@�;$@��     �;$@@>$@       �$@           ��$@           X�$@            �$@           ��$@           h�$@           (�$@           �$@    	       ��$@    
       p�$@           X�$@           @�$@           ��$@           ��$@           ��$@           h�$@           0�$@           ��$@           `�$@           �$@           ��$@           ��$@           ��$@           p�$@           X�$@           �$@           ��$@                    �                      0                   	             0   �                ��      ��$@��$@��
     X>$@�?$@       8�$@            �$@           ��$@           ��$@           p�$@           X�$@           @�$@           ��$@    	       ��$@                    �                   D D E ��                        8                   	 
                 8                  ��      ��$@`?$@��     �?$@A$@       H�$@           �$@           ��$@           X�$@           @�$@           �$@           ��$@           p�$@    	       X�$@    
       @�$@            �$@           Џ$@           ��$@                      (               D D E ��G H     (                                           8                   	 
                 8                  ��      ��$@�@$@��     @A$@(A$@       ��$@           P�$@            �$@           ��$@           ��$@           H�$@           ��$@           Ќ$@    	       ��$@    
       ��$@           ��$@           0�$@           ��$@                                                                                                                                                                                                                                                                                                                        	�$��[]();/\�����+-��*���^�<�=�>������,!����?~������_����������ܭ�����}{��abcdefghijklmnopqrstuvwxyz�ABCDEFGHIJKLMNOPQRSTUVWXYZ�0123456789.� ':�
���������������������������������|`#@"����%&��徼�������е�����뱿��������                           	
 !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~��������������������������������������������������������������������������������������������������������������������������������                                       ����               ����                                 �                                                                                                G$@                                                              x                  G$@�F$@�F$@�F$@�F$@�F$@pF$@XF$@@F$@(F$@F$@�D$@�C$@�C$@�C$@pC$@PC$@0C$@C$@�B$@�B$@�B$@�B$@x   `(        A(  A(      
          ------  "sapl.rsinit" documentation  ------                 
                                                                      
      sapl.rsinit - r� sapl.rsinit MM,ncs                             
                                                                      
 'sapl.rsinit' is a monadic function which creates the control vector 
                  required to use sapl.rsencode and sapl.rsdecode to  
                  generate and use Reed Solomon error correction codes.
                                                                      
 "MM"      is the width, in bits, of the symbols used in the code.    
           This is almost always 8 (meaning that 1-byte character     
           values are the data elements of the code), but values from 
           2 through 16 are supported. The bit width also selects the 
           block size, with a data block always containing ((2*NN)-1) 
           symbols. Thus, if MM is 8, blocks are 255 bytes in length. 
           Note that large values (more than 10 or so) can result in  
           the calls to sapl.rsencode and sapl.rsdecode being quite   
           expensive, especially if the number of errors is large.    
                                                                      
 "ncs"     is the number of check symbols in each block.              
           This directly controls how resilient the encoded data will 
           be to errors. Each check symbol can correct a single corrupt
           symbol anywhere in the block if its location is known. Each
           pair of check symbols can correct a single corrupt symbol  
           anywhere in the block if its position (and the fact that it
           is corrupt) is not known.                                  
                                                                      
 "r"       is a control vector, which must be passed unchanged to each
           sapl.rsencode or sapl.rsdecode call.                       
                                                                      
                                                                      
                  -----  Acknowledgements  -----                      
                                                                      
 The algorithms used for sapl.rsinit, sapl.rsencode, and sapl.rsdecode
are based on code placed into the public domain by Phil Karn (KA9Q).  
His code was in turn based on code placed into the public domain by   
Robert Morelos-Zaragoza (robert@spectra.eng.hawaii.edu) and Hari      
Thirumoorthy (harit@spectra.eng.hawaii.edu), dated Aug 1995. The basic
algorithms and portions of these earlier programs are used in these   
intrinsics with the kind permission of these authors.                 
                                                                      
                                                                      
              -----  Cautions and Usage Notes  -----                  
                                                                      
 Reed Solomon checksums are invariant with respect to certain block   
transformations. In particular, if � is a valid RS codeword (that is, �
is (d,c) where c is a RS check string for the data d), then n�� is also
a valid RS codeword for the same code.                                
                                                                      
 This fact can lead to unexpected behaviour, especially for RS codes  
with large error tolerances. For example, using an RS code with 32    
check symbols, the block (15��,15�x) (for random x) will be decoded as
15��, with 15 errors corrected (assuming that 0=+/x=15��). The original
� will in fact have been reconstructed, but it will have been seen by 
the decoder as having 1�15�� as its first byte. The first 15 bytes will
have been rotated onto the end of the codeword, and 15 of the check   
symbols will have been shifted into what the caller will see as the   
last 15 data positions.                                               
                                                                      
 This behaviour means that it is imperative, in any situation where   
block framing can become purturbed, that RS data protection be paired 
with some mechanism for detecting rotations. The 16 and 32 bit CRC    
checksums are ideal for this purpose; see the sapl.crc16 and sapl.crc32
intrinsics.                                                           
                                                                      
 The workspace <1 rspc> contains a utility showing RS codes in actual 
use to provide customisable error protection for sequential byte      
streams. The utility is not simple, and it can be very expensive to   
use it to recover seriously damaged files, but it does deal with      
the issues mentioned here. It would be a good place to start for      
anyone using Reed Solomon codes for the first time.                   
                                                                      
                                                                      
                     -----  Examples  -----                           
                                                                      
 The following are very simple examples to show basic syntax and      
usage. The syntax and semantics for sapl.rsencode and sapl.rsdecode   
are given by separate descriptions for these intrinsics.              
                                                                      
                                                                      
-------------Examples------------------------Commentary-------------- 
                                    -                                 
   'sapl.rsinit' IFbind 'rsinit'    - Form IFN Bind named 'rsinit'    
2                                   - Bind successful                 
                                    -                                 
   'sapl.rsencode' IFbind 'enc'     - Form IFN Bind named 'enc'       
2                                   - Bind successful                 
                                    -                                 
   'sapl.rsdecode' IFbind 'dec'     - Form IFN Bind named 'dec'       
2                                   - Bind successful                 
                                    -                                 
                                    -                                 
   CE�rsinit 4 6                    - CE controls a 4-bit code with   
                                    - 6 check symbols                 
                                    -                                 
   ��D��9                           - Data length is �6 + (2*4)-1     
0 1 2 3 4 5 6 7 8                   - Max data value is 15 = (2*4)-1  
                                    -                                 
   ��C�CE enc D                     - RS Checksum symbols - 6 of them 
13 5 2 3 5 12                       -                                 
                                    -                                 
   �X�D,C                           - "Transmitted" codeword -        
15                                  - 15 = (2*4)-1 symbols long       
                                    -                                 
   R�X                              - R is "received" codeword (0 errs)
                                    -                                 
   +/X=Rc�1�q�CE dec 0,R            - Rc is corrected codeword        
15                                  - Rc agrees with X                
   1�q                              - How many errors were detected?  
0                                   - None.                           
                                    -                                 
   R[1 3 6]�0                       - Introduce 3 errors              
                                    -                                 
   +/X=Rc�1�q�CE dec 0,R            - See if decode can fix errors    
15                                  - Yes, Rc has been corrected      
   1�q                              - How many errors were detected?  
3                                   - 3.                              
                                    -                                 
   R[8]�0                           - Introduce a 4th error           
   �q�CE dec 0,R                    - See if decode worked            
0                                   - No, too many errors to decode   
                                    -                                 
   +/X=Rc�1�q�CE dec 2,1 3,R        - Try decode with known erasures  
15                                  - Yes, Rc has been corrected      
   1�q                              - How many errors were detected?  
4                                   - 4.                              
                                    -                                 
   R�3�X,3�15                       - Trim front of block and pad.    
                                    -                                 
   +/X=Rc�1�q�CE dec 0,R            - Try to correct it.              
1                                   - Does not look good.             
   1�q                              - How many errors were detected?  
3                                   - 3. This is correct.             
                                    -                                 
   +/X=�3�Rc                        - Is the corrected block rotated? 
15                                  - Yes, it is.                     
                                    -                                 
   X                                - What we started with.           
0 1 2 3 4 5 6 7 8 13 5 2 3 5 12     -                                 
                                    -                                 
   R                                - What we fed sapl.rsdecode       
3 4 5 6 7 8 13 5 2 3 5 12 15 15 15  -                                 
                                    -                                 
   Rc                               - What we got as a corrected result
3 4 5 6 7 8 13 5 2 3 5 12 0 1 2     -                                 
                                    -                                     `(          wt      ��lx  issu           0) SaplRsdecode rs           0) SaplRsencode l.          ���tc3 ����         ���tc2 ����   �        �  �      
          ------  "sapl.rsdecode" documentation  ------               
                                                                      
    sapl.rsdecode - r� control sapl.rsencode epblock                  
                                                                      
 'sapl.rsdecode' is a dyadic function which uses the Berlekamp-Massey 
                 method to attempt correction of a possibly corrupted 
                 data block that was transmitted with Reed Solomon    
                 check symbols.                                       
                                                                      
 "control" is a Reed Solomon control vector generated by sapl.rsinit  
                                                                      
 "epblock"  is a character or numeric vector of form (epc,epv,block). 
                                                                      
      epc   is the count of known erasures (ie, the number of symbols 
            in the received block that are known to be incorrect).    
            This count must be no greater than the number of check    
            symbols specified for the code.                           
                                                                      
      epv   is the vector, length "epc", of 0-origin erasure locations
            (ie the 0-origin indices in "block" of known erasures).   
                                                                      
      block is the received codeword, length ((2*MM)-1) where MM is
            the bit-width of the code symbols, whose transmitted
            (undamaged) form is (data,check-symbols). See sapl.rsencode
            for creation of the check-symbols.                        
                                                                      
                           ---------                                  
                                                                      
  See the description of sapl.rsinit for examples using sapl.rsdecode,
and for important usage notes and cautions about Reed Solomon error   
correcting codes.                                                     
                                                                      
                           ---------                                  
                                                                      
 "epblock" may be character for a symbol size of 8 bits or less, and if
so "r" will also be character.                                        
                                                                      
 "r" will be set to the vector (nc,codeword), or to an empty vector if
the codeword can not be corrected. If an empty vector is not returned,
"nc" is a single symbol reporting the number of errors that were found
and corrected, and "codeword" is the corrected (data,check-symbols).
                                                                      
 If "n" check symbols are defined for the RS code, then the algorithm 
can correct as many as "n" declared erasures, or (�n�2) undeclared    
errors, or any combination with each undeclared error counting as     
two declared erasures. Thus, a code with 10 check symbols could correct
6 declared erasures and 2 undeclared errors in a single block, but    
would fail to correct a block which had 7 declared erasures and 2     
undeclared errors.                                                    
                                                                      
 Please note that Reed Solomon codes are not themselves good error    
detection codes, because they are invariant with respect to some      
block transformations. For example, if "D" is an error-free block     
that includes RS check symbols, then (n�D) (for any n) is also an     
error-free block. RS correction will not alter such rotations although
it will correct normally errors introduced into rotated blocks. This  
means that any situation which may require detection or correction of 
framing errors (ie, where it may not be clear exactly where a block   
is supposed to start after an error) must use some other scheme to    
detect improperly framed blocks (CRC checks are a good choice, see    
sapl.crc16 and sapl.crc32). RS codes can with care be used to correct 
or reconstruct partial blocks in such situations, although the cost   
of the computations involved can become rather high, as typically many
possible blocks must be corrected and checked to locate a good,
properly framed codeword.2�  �        �  �      
          ------  "sapl.rsencode" documentation  ------               
                                                                      
    sapl.rsencode - r� control sapl.rsencode block                    
                                                                      
 'sapl.rsencode' is a dyadic function which generates Reed Solomon    
                 check symbols from a given input, for a chosen code. 
                                                                      
 "control" is a Reed Solomon control vector generated by sapl.rsinit  
                                                                      
 "block"   is a character or numeric vector of symbols valid for the  
           chosen code, and with the correct length for that code.
                                                                      
                           ---------                                  
                                                                      
  See the description of sapl.rsinit for examples using sapl.rsencode,
and for important usage notes and cautions about Reed Solomon error   
correcting codes.                                                     
                                                                      
                           ---------                                  
                                                                      
 "block" may be character for a symbol size of 8 bits or less, and if 
so "r" will also be character.                                        
                                                                      
 "r" will be set to the vector of RS check symbols for the indicated  
code. The full RS-protected codeword, which may be given as input to
sapl.rsdecode for correction, is (block,r); this codeword is always
(2*MM)-1 symbols in length, where MM is the symbol size of the code.  
                                                                      
 Thus, if an 8-bit code with 16 check symbols is used, �block must be 
239, and �r will be 16, so that (block,r) will be the required 255-byte
RS-protected codeword.
                                                                         �        ���tc1    �             SaplRsinit tc1 �    (               2   @ ��A H ncor(          9.q2 % of           brq1 , and   P      0
�ptable[0;]�ptable[1;]�,�(8�2)���av�cr � Set the initial value 1]P   P      0	  �(0�cr��av)�'�' � cr must be 4-element character vector L 
 M P          0
��(4��cr)�'�'  p�          0	��io�0 �         0
0� gf�1     (      0
p� prepended to it.    (   P      0	�� same result as if the data from the previous call had been ��P   X      0
�� The result is that the next call using ptable will produce the 
 M   X         0
X� R       H      0
h� to allow us to undo the effects of the terminal XOR.  H   P      0
�� The ptable really must be the one used for the previous call, P   X      0	�� where cr is the result of a previous CRC call using ptable "ptable". �X   P      0	� Set the initial value for a CRC-32 ptable argument to cr, ,(0�P   8      0
�ptable�ptable crcsetiv32 cr;�io;q1;q2  8             crcsetiv32 D E��          niicr value            ptable     P      0�ptable[0;]�ptable[1;]�,�(8�2)���av�cr � Set the initial value 1]P   P      0	8 �(0�cr��av)�'�' � cr must be 2-element character vector L 
 M P          0
��(2��cr)�'�'  p�          0	��io�0 �         0
�� gf�1     (      0
�� prepended to it.    (   P      0	�� same result as if the data from the previous call had been   0P   X      0�� The result is that the next call using ptable will produce the  to cr,X         0
�� R       H      0
p� to allow us to undo the effects of the terminal XOR.  H   P      0�� The ptable really must be the one used for the previous call, P   X      0�� where cr is the result of a previous CRC call using ptable "ptable". �X   P      0	�� Set the initial value for a CRC-16 ptable argument to cr, ,(0�P   0      0
�ptable�ptable crcsetiv16 cr;�io 0             crcsetiv16          P     m  0  V   H               ------  "sapl.crc32" documentation  ------                                                                                              sapl.crc32 - r� ptable crc32 argument                                                                                                        'sapl.crc32' is a dyadic function whose left argument is a boolean     table (the result of the "crctable32" function in this workspace),      and whose right argument is a character list. The result is a four      character list which contains the 32-bit CRC sum for the characters     provided in the list, according to the polynomial and parameters used   to construct the boolean table. (This "sum" is actually the remainder   from a boolean polynomial division.)                                                                                                             This sum can be used to validate correct transmission or storage of    the character list; if the sum is catenated to the end of the list      the CRC sum of the resulting vector will (using the same polynomial)    be 4�1��av. The exact probability of an undetected error depends        upon the chosen polynomial. For a discussion of the algorithm used see                                                                               Computation of Cyclic Redundancy Checks via Table Look-up               CACM Aug 1988, volume 31 Number 8                                  See also                                                                     Computer Networks, by A. S. Tanenbaum, Prentice-Hall, Englewood         Cliffs, NJ, 1981.                                                                                                                          There appears to be only one "standard" CRC-32 polynomial:                  CRC-ZIP   =  x32 + x26 + x23 + x22 + x16 + x12 + x11                                 + x10 + x8 + x7 + x5 + x4 + x2 + x + 1                                                                                          This polynomial is used in PKZIP, and also reportedly by ATM (AAL5),   FDDI, and Ethernet, but see the note below about specific.              implementations.                                                                                                                                 One table for this polynomial has been been computed via "crctable32", to be found in this workspace as the variable T32CRCZIP. This version   of the table specifies an initial value of 0xFFFFFFFF and a terminal    complement with 0xFFFFFFFF; this makes the algorithm compatible with    PKZIP.                                                                                                                                                                                                                   Note that although the polynomial is indeed standard, the exact        computation of the CRC sum from a particular input string is not        solely determined by the polynomial. In specific implementations        byte reflections and differing initial values and output masking        are common. Since "crctable32" allows specification of the initial      value and an output mask, this function should be able to process       most externally supplied CRC sums, as long as the external algorithm    is well understood.                                                                                                                              There is a function in this workspace (1 if) called "ZIPcrc" that      illustrates how to use sapl.crc32 to compute exactly the CRC sums       used by PKZIP.                                                                                                                                                                                                                           -----  Usage Notes  -----                                                                                                       Normally, a user will choose to use the polynomial for which           a ptable has already been built. If a different polynomial is           required, crctable32 has usage documentation in its header.                                                                                      If a crc-32 check is to be computed incrementally (that is, a single   check is to be kept across multiple blocks), this is accomplished by    setting the initial value (in the ptable) for each call of sapl.crc32   to the result of the previous call. This should always be done using    the crcsetiv32 function found in the workspace 1 if; the ptable value   should never be directly modified by the user. When this is done, care  should be taken that the initial value used for the start of a series   of calls is the proper initial value.                                                                                                           -------------Examples------------------------Commentary--------------                                       -                                                                       -                                      'sapl.crc32' IFbind 'crc32'      - Form IFN Bind named 'crc32'        2                                  - Bind successful                                                       -                                      �mylist                          - 'mylist' is char list              3707                               -   3707 chars long                                                     -                                      �T�T32CRC32 crc32 mylist         - Compute CRC-32 check code          4                                  -   of character list 'mylist'                                          -                                      X�T32CRC32 crc32 mylist,T        - Compute checksum of list with                                         -   CRC-32 check code appended.                                         -                                      (-�io)+�av�X                     - Check that 'mylist' and 'X' are OK 0 0 0 0                            - Yes, both lists are verified.                                         -                                   0h�P  �        �  T   H               ------  "sapl.crc16" documentation  ------                                                                                              sapl.crc16 - r� ptable crc16 argument                                                                                                        'sapl.crc16' is a dyadic function whose left argument is a boolean     table (the result of the "crctable16" function in this workspace),      and whose right argument is a character list. The result is a two       character list which contains the 16-bit CRC sum for the characters     provided in the list, according to the polynomial and parameters used   to construct the boolean table. (This "sum" is actually the remainder   from a boolean polynomial division.)                                                                                                             This sum can be used to validate correct transmission or storage of    the character list; if the sum is catenated to the end of the list      the CRC sum of the resulting vector will (using the same polynomial     table) be 2�1��av. The exact probability of an undetected error depends upon the chosen polynomial. For a discussion of the algorithm used see                                                                               Computation of Cyclic Redundancy Checks via Table Look-up               CACM Aug 1988, volume 31 Number 8                                  See also                                                                     Computer Networks, by A. S. Tanenbaum, Prentice-Hall, Englewood         Cliffs, NJ, 1981.                                                                                                                          There are three "standard" CRC-16 polynomials:                              CRC-12      =  x12 + x11 + x3 + x2 + x1 + 1                             CRC-16      =  x16 + x15 + x2 + 1                                       CRC-CCITT   =  X16 + X12 + X5 + 1                                                                                                            The tables for these have been computed via "crctable16", and are      to be found in this workspace as the variables T16CRC12, T16CRC16,      and T16CRCCCITT.                                                                                                                                 Note that, although the polynomials are indeed standard, the           exact computation of CRC sums from a particular input string is not     solely determined by the polynomial. In specific implementations        byte reflections and differing initial values and output masking        are common. Since "crctable16" allows specification of the initial      value and an output mask, this function should be able to process       most externally supplied CRC sums, as long as the external              algorithm is well understood.                                                                                                                    The 16-bit tables listed above all have initial values and terminal    complements of 0.                                                                                                                                The CRC-12 algorithm is only useful for 6-bit data items. The two      16-bit polynomials will detect all 1 and 2 bit errors, all errors       with an odd number of (incorrect) bits, all bursts with 16 bits         or less, 99.997% of 17-bit error bursts, and 99.998% of 18-bit and      longer bursts.                                                                                                                                                   -----  Usage Notes  -----                                                                                                       Normally, a user will choose one of the polynomials for which          a ptable has already been built. If a different polynomial is           required, crctable16 has usage documentation in its header.                                                                                      If a crc-16 check is to be computed incrementally (that is, a single   check is to be kept across multiple blocks), this is accomplished by    setting the initial value (in the ptable) for each call of sapl.crc16   to the result of the previous call. This should always be done using    the crcsetiv16 function found in the workspace 1 if; the ptable value   should never be directly modified by the user. When this is done, care  should be taken that the initial value used for the start of a series   of calls is the proper initial value.                                                                                                           -------------Examples------------------------Commentary--------------                                       -                                                                       -                                      'sapl.crc16' IFbind 'crc16'      - Form IFN Bind named 'crc16'        2                                  - Bind successful                                                       -                                      �mylist                          - 'mylist' is char list              3707                               -   3707 chars long                                                     -                                      �T�T16CRC16 crc16 mylist         - Compute CRC-16 check code          2                                  -   of character list 'mylist'                                          -                                      X�T16CRC16 crc16 mylist,T        - Compute checksum of list with                                         -   CRC-16 check code appended.                                         -                                      (-�io)+�av�X                     - Check that 'mylist' and 'X' are OK 0 0                                - Yes, both lists are verified.                                         -                                   0�  p        O  O                   ---------------  sapl.nextprime ---------------

        r � sapl.nextprime na

 Set "r" to the next prime(s) equal to or greater than na.

 "na" may have any shape, but must be a simple numeric array, none of whose
elements has a magnitude greater than or equal to 2*31, and each of which is
tolerantly equal to the integer of nearest value.

 The result will have the same shape as "na". For each element "e" of "na",
the corresponding element of the result will be "e" if it is prime; otherwise
it will be the (positive) prime nearest to but greater than e. If "e" is less
than 2, the result will be 2.

                                                                     
-------------Examples------------------------Commentary--------------
                                    -                                
   'sapl.nextprime' IFbind 'npr'    - Form IFN Bind named 'npr'      
 2                                  - Bind successful                
                                    -                                
   npr �123 0 13 1e6                - Try 4 different numbers
 2 2 13 1000003                     -
                                    -                                
                                                                             
                                                                     
    7p            SaplNextprime             ���FLIP ���         ���v ������   @      0 �r�FLIP[�av�T32CRCZIP IFcrc32 FLIP[�av�v]]     @   H      0 �FLIP��av[2��(8�2)��256] � For flipping character values H         0 �io�0 (�         0 �� 0 c  '   8      0 ��    IFcrc32   A bind to sapl.crc32    8   P      0h�    T32CRCZIP Polynomial table (from SAX workspace <1 if>) 0]�1P   (      0!@� Global inputs:       (         0 ��    �   X      0 h� Compute PKZIP 32-bit CRC for character vector v, using sapl.crc32 l* �X   (      0!�r� ZIPcrc v;�io;FLIP   (         ���ZIPcrc 0          ���P32CRCZIP ������    (     0 @         ��������    ��	�;nC&�v��kk�M�GP&��"��/���+K�a5�d1͆�<��
8O��L�pH���E��AR��_��[԰V���RV�uj6�n�+c��gZy@}�]�p�{zt^f͘#����W�����`�9�'�<��݋���R�d��+[X��F﷩`6�h}��/-���03���l]�2m���p'ݰV��qKI�6L���δ "�u=��:�(�������F�y���>�����C�͚�}�-4�pw0Gm�=K9�V�'��#C. =�*� r���O�x��ͻ��K���}���x��|V��q�iuԍ�k���oR�lb�f��^�F�Z^[W}�S�`fM�0cIZ-�D@����Ɨ�d� �'�����N���K�`���#�%�▒��+/�l6��/A�����]�h@D�+f���{*���u P�6&���;>�k;�qv��2PU��M�Ƽ�_�}���>�1��ֆո���y�4�:�����Zi��m��Y`�ۀdO�7z�2~ɋ�s��\wK��OVK��F�68BG+�\ {�X�f=U�@�QC]S%;�!�&),� �(^G6MB2�P�?�v,;Zk��&�ˑ
��HV����нM���R�#�/V��K���m`�lp��+ ���=e���h�'����ޥ���d�o�#�j����͡��`볽>�~���ɴ���}���:��������̣y�{�6`Ɵ�}q��[��uF�2�����-t�q0�]���YK�.T��Pɶ@N��EJO��G�+C���{�}!C`�r FOv�[�h��lGJa0�e�-$�K�ZV^p��m0�=5^ �[��7��Q3R��>�?:Ѐ�$�Ѝ V�:-��)��Tũ&y�h;��+�� �֭P��lM�/k���v|����`�v�#������d���'�s��ĉ��	�yྀ:�g���К��՞}�b�>���������q�2+ߢ�6h��fm�u{ڵ6]��@�   (         ���T32CRCZIP ������           ���SaplCrc32 ������    0              2 3 4 5 6 7 8 ��9  ����0   (      ?�!   !       �`�ۀ   0
;�(         ���gl31 ���   H      08r�~~pm���[1] i^ 256 8 32 �g[;32+�32] � 256�32 table    H   H      0 i� 2 1 0 � 32 8 256 �(8�2)��256 � Generator for tables dH         0 �� l2       P      0 �� g is now the generating polynomial; now just make the table ��P         0 �� 0 1�ar         0 xg���g pl          0 ���� 8 �32 ��g             0 ��(8>1��g)�l �       8      0 H gl31�gl[31] � GL31 is x�31 term.   ,' '8          0 �l:gl�,�1�g  Rnpp    0      0 �g� 1 64 �p�64��p � x0,x1,,,,x63 0   8      0 0pm�2 32�pm � Ensure correct size   ,8   P      0!��(0=�nc 'pm')/'pm�2 32�0' � Provide default parameter matrix ]�1P         0 `�io�0 (�         0 � 0 c  '   H      0 @� Table Lookup', CACM Aug 1988, volume 31 Number 8 0"��H   X      0  � Algorithm adapted from 'Computation of Cyclic Redundancy Checks via  X         0 ��    �   @      0 0�                           coefficient vector. @   P      0  � Right argument: order-32 polynomial as a 33-element boolean 0�P   H      0 ��                           Default is (2 32�0).   el* H   X      0 ��                           and row 1 is exor'd with the result.      X   X      0x� Left argument (optional): 2 x 32 matrix, row 0 is the initial string  X   X      0 �� Create table (256�32, really four tables) for fast CRC algorithm  l* �X         0!�� gf�1     8      0!�r�pm crctable32 p;gl;gl31;g;i;�io     8          ���crctable32 �����          ���l ������   (      0 `� ��(�gl31),' : ',�gl  (         ���i ������         ���g ������         ���gl15 ���         ���gl �����         ���p ������         ���pm �����         ���r ������   (      0 �g�g�(�1�0,gl)�gl31^p    (   H      0 � r�pm�~~��[1] i^ 256 8 16 �g[;16+�16] � 256�16 table  *dH   H      00 i� 2 1 0 � 16 8 256 �(8�2)��256 � Generator for tables H         0!�� 0        P      0!h� g is now the generating polynomial; now just make the table  tP         0 �� l3             0 X g���g            0� �(8>1��g)�l        (      0� g�g�(�1�0,gl)�gl15^p   (   (      0@� ��(�gl15),' : ',�gl  (   8      0 p gl15�gl[15] � GL15 is x�15 term. �l  ;]8          0hl:gl�,�1�g  Rnpp    8      0 � g� 1 32 �p�32��p � x0,x1,,,,x31 '  ,' '8   8      0 �pm�2 16�pm � Ensure correct size    (8   P      0��(0=�nc 'pm')/'pm�2 16�0' � Provide default parameter matrix ]�1P         0!8 �io�0 r         0! � l7 epl   X      0p�         compute type, so we take care to produce it thus.../LOC  �HX   X      0 � **NOTE: The SAX sapl.crc16 IF requires that the table have BOOL r[1]+(X         0!�� 0 )^(�         0!�� 0 c  '   H      0 �� Table Lookup', CACM Aug 1988, volume 31 Number 8 0"��H   X      0� Algorithm adapted from 'Computation of Cyclic Redundancy Checks via  X         0!`�    �   @      0!��                           coefficient vector. @   P      0!�� Right argument: order-16 polynomial as a 17-element boolean 0�P   H      0 `�                           Default is (2 16�0).    �edH   X      0 ��                           and row 1 is exor'd with the result. �0 @X   X      0 �� Left argument (optional): 2 x 16 matrix, row 0 is the initial string  X   X      0x� Create table (256�16, really two tables) for fast CRC algorithm   l* �X         0 (� gf�1     8      0 �r�pm crctable16 p;gl;gl15;g;i;�io     8          ���crctable16 �����           ���SaplCrc16 ������          0               �� 
�  ��3 6 <�9 (�-�' "�c f l�i x�}�w r P�U�_ Z�K N D�A�� � ̀� ؀݀� � ����� ��� � �� ����� ��� � ����� � ��� ����� ������������������������������������܁�ȁ́��@�E�OJ�[^T�Q�sv|�yh�m�gb�#&,�)8�=�72������	��0�5�?:�+.$�!`�e�oj�{~t�q�SV\�YH�M�GB��Ń�ʃ��ԃу��������⃣���������������������������������������������������������ЂՂ�ڂ��Ă��CFL�IX�]�WRp�u�z�knd�a �%�/*�;>4�1����          ���T16CRC16 �������           0	         ��           ���P16CRC16 �������          0               0(`<x3P"H-�x�w�f�i�D�K�Z�U��������������X�@�h�p�8� ���)�1���I�Q�y�a���ٗ���������������2�=�,�#qviyAhYgJ	E!T9[S�K�c�{�3�+��ϓ���������ø۷�����!�.�?�0ej;{#tkYsV[GCHzbJR/ *12>�k�d�u�z�W�X�I�F���������К߲Ϊ�"�:��
�B�Z�r�j��Ŀ˗ڏ���������g��W�O���7�/�?;'4%*_Gow�C�L�]�R��p�a�n�5�:�+�$�	���NMVB~Sf\.q6~o`��&�>�v�n�F�^�ֲν������������&�)�8�7����4^,Q@OTbLmd||sl�t�\�D���<�$���������̝Ԓ����������ƽ�������-�5�}�e�M�U�E(]'u6m9%=
�P�_�N�A�l�c�r�}          ���T16CRC12 �������           0
      6   ��           ���P16CRC12   �   8                          ! B0c@�P�`�p��)�J�k��ѭ����12s"RR�B�r�b֓9��{�ZӽÜ����$b4C d�t�D�T��j�K�(�	����ŬՍ6S&r0v�f�V�F��[�z��8����םǼH�X�h�x�@a(8#��������H�i�
�+Z�J�z�j�q
P:3*������랛y�X�;�l�|�L�\�,"<`A�������ͭ*��h�I~�n�^�N�>.2Qp���������:�Y�x�����ʡ���-�N�o� �0� �P@%pF`g���������=���^��"�2�B5RbwrV��˕����n�O�,�4�$���tfdGT$D�۷������_�~��<&�6���fWvvFV4�L�m��/�ȉ鹊��XDHexh'��8�(��}�\�?����ث���JuZTj7z
��*�:��.��l�M�������|&l\dLE<�,�����>�]�|�����ٟ�n~6NU^t.�>���          ���T16CRCCCITT 0
�           0         ���              P16CRCCCITT ��             �  �      

Workspace <1 if> contains documentation of the IF/IFN-Bind
facility, and of the Intrinsic Functions included as part of the
base SHARP APL for UNIX system, as well as copies of IFN Binds to
system.bind, system.bindrep, system.list, system.def, and
system.erase. 

See variable <intro> for a general introduction to the IF
facility.  
  
See variable <binds> for a description of how IFN binds are
treated by, and fit into, the Sharp APL system.  

See variable <SystemXxxxx> for a description of the IF named
system.xxxxx. 
  
See variable <SaplXxxxx> for a description of the IF named 
sapl.xxxxx.
 
See variable <UnixXxxxx> for a description of the IF named
unix.xxxxx. 
 
See variable <SystemBind> for a description of the system.bind
IF, as well as a description of the display form of an IFN Bind.
   
 The following binds exist in this workspace: 
     IFbind (system.bind)          IFdef (system.def) 
     IFrep (system.bindrep)        IFerase (system.erase) 
     IFlist (system.list)            r    �        �  F   O              ------  "system.def" documentation  ------                                                                                                                                                                                             system.def - define or query the definition of an intrinsic                                 function or group.                                                                                                                           The righthand argument of system.def is always a character vector             (or scalar) containing the name of an intrinsic function or group.             If used monadically, the definition of the named function or group             is returned as a character vector.  Dyadically, system.def defines             the named function or group.                                                                                                                                   The definition of an intrinsic group or function is a character vector        containing a keyword describing the type of function or group, and the         information describing the function or group.                                                                                                                                                                                                Groups:                                                                         There are two kinds of intrinsic function groups, static and dynamic.         A static group, such as <system>, exists within the interpreter itself,        while a dynamic group resides externally.  The definition of a static          group consists of the keyword 'static' only; the definition of a dynamic       group contains the keyword 'dynamic' followed by the pathname of the file      which contains the set of intrinsic functions, for example:                                                                                                         IFdef 'socket'   � Query definition of <socket> group.                   dynamic /usr/sax/rel/lib/socket.si                                                   'dynamic /home/joe/utils/mystuff.si' IFdef 'myutils'  � Define <myutils>.                                                                                                                                                                                                                                             Functions:                                                                      There are two kinds of intrinsic functions which can be defined, APLfunction  and Cfunction.  Currently it is only possible for users to define Cfunction    intrinsics, while the intrinsics embedded in the interpreter are all           APLfunction intrinsics.  The difference between the two styles is in the       way that they are called by the interpreter, and the only time the user        will see the existance of APLfunction intrinsics is when using system.def      monadically to query their definitions.                                                                                                                        Cfunction intrinsics are used in dynamically loaded intrinsic groups, and     can be defined by either a .saxif file or with dyadic use of system.def.       Consider a .saxif file which contained the following rows:                                                                                                    mygroup dynamic     /home/joe/utils/mystuff.si                                 handyfn Cfunction   int handyfn(char *, long)                                  version Cfunction   char *version()                                                                                                                           The following explicit uses of IFdef will achieve the same as the above        definitions:                                                                                                                                                        'dynamic /home/joe/utils/mystuff.si' IFdef 'mygroup'                           'Cfunction int handyfn(char *, long)' IFdef 'mygroup.handyfn'                  'Cfunction char *version()' IFdef 'mygroup.version'                                                                                                                                                                                     Monadically, system.def returns the definition of an intrinsic group or       function, or an empty vector if the named group or function does not exist.    Dyadically, system.def is used to define an intrinsic group or function.       A domain error is signalled if the group or function being defined already     exists.  Note that the system.erase intrinsic can be used to erase the         definition of an intrinsic function or group.                                                                                                                                                                                                 The system command   )ifdef group[.fn] [defn]   can also be used to provide   this functionality.  For example,                                                    )ifdef mygroup                                                           dynamic /home/joe/utils/mystuff.si                                                   )ifdef mygroup.handyfn Cfunction int handyfn(char *, long)                                                                                                �  �	      q n	  "   G              ------  "system.list" documentation  ------                                                                                                                                                                    system.list - list intrinsic functions or groups.                                                                                         The righthand argument of system.list is always a character vector    (or scalar) either empty or containing the name of a single intrinsic  function group.                                                                                                                                If the right argument does not contain a name, the result of IFlist isa character matrix listing every intrinsic function group defined on   the system.                                                                                                                                    If the right argument contains the name of an intrinsic group, the    result is a character matrix with one row for every function defined   in that group.  If the named group does not exist, domain error is     signalled.                                                                                                                                     For example,                                                                IFlist ''                                                        sapl                                                                   socket                                                                 system                                                                 unix                                                                         IFlist 'system'                                                  bind                                                                   bindrep                                                                def                                                                    erase                                                                  list                                                                                                                                                                                                                  Note that the system command   )iflist [group]   also provides this   functionality.                                                               �	                N              ------  "system.erase" documentation  ------                                                                                                                                                                                        system.erase - erase an intrinsic function or group                                                                                                     The righthand argument of system.erase is always a character vector          (or scalar) containing the name of an intrinsic function or group.            The definition of the intrinsic function or group is removed from the         system.  Only dynamic groups, or functions within dynamic groups, can         be erased.  A domain error is signalled if the group or function named        in the right argument does not exist, or if it names a group which has        functions in it.  When the right argument names a function in a dynamic       group, or a dynamic group which has no functions, the group or function       is erased and an empty result is returned.  For example, in order to          remove all the functions in the group <mygroup>, and to remove the group      itself:                                                                                                                                                           IFerase�1 'mygroup.',�1 IFlist 'mygroup'   � Erase all fns in <mygroup>.      IFerase 'mygroup'              � Erase the (now empty) <mygroup>.                                                                                                                                                                    Note that the   )iferase group[.fn]   system command can be used to provide  this functionality.                                                                0             erasH%@x%@�%@P�%@se' 0                         ��    (                 ^ system.list (   (            ����   IFdefm.list (   (               
  ��-     ��(            IFdef i   0               1    system.erase   An IF0   (             ase���-    f ns(   0             list�%@x%@�%@P�%@' �p0   (            ����ase�SystemDef te(             SystenBind ' ��          bidx s ifit          pIFlist    0             def'�%@%@�%@P�%@ ��0   (                 ��-        (            IFerase    (            ����                (   (                   system.def  (   �        {  -   G             ------  IFN Bind behaviour and Treatment  ------                                                                                     An IFN bind is a limited form of a name association; limited in that  the association is always with a Sharp APL Intrinsic Function.                                                                                 The Sharp APL system attempts in most situations to treat a bind as ifit were a locked function, but there are some situations in which this is either inconvenient or not the ideal behaviour. These situations aredetailed here for reference (not all the points mentioned here are     differences from locked function behaviour; these are included for     reference).                                                                                                                                    1�fd    There is a display form for an IFN bind (see SystemBindrep),   2�fd    but in order to preserve the similarity between binds and      �cr     locked functions, these primitives return empty results                when invoked for an IFN Bind.                                                                                                         1 �ws   An IFN Bind has been assigned the (previously unused) symbol   5 �ws   class of "16". Thus  1 �ws 16  will list the names of all              binds defined at the current lexical level, and 5 �ws 'IFbind'         will return 16 if invoked in immediate execution in this               workspace.                                                                                                                            �nl     These primitives were defined for compatibility with the APL   �nc     standard, which does not contain IFN binds. They therefore             ignore binds (�nc 'IFbind' returns '4', meaning the symbol             is invalid).                                                                                                                          4 �ws   Reports the space occupied by the bind. A bind is physically           stored as a single object within the workspace, containing             a small amount of control information plus the information             returned by system.bindrep.                                                                                                           s�IFN   Unlike locked functions, which tolerate (but ignore) attempts  t�IFN   to set trace lines, IFN binds will reject such attempts with           a syntax error.                                                                                                                       7 �fd   An attempt to lock an IFN bind will result in a domain error.                                                                         6�fd    Erasure of a bind proceeds normally, except in a sealed        �ex     workspace, where (as with functions), erasure is prohibited    )erase  for security reasons.                                                                                                                 �pnc    Binds which exist in packages return a name class value of �2.                                                                        �          �SystemList   �X                      �        h  h                    ------ "sapl.version documentation" ------

   sapl.version - sapl.version �0

The sapl.version intrinsic function is a statically-linked, APL-style intrinsic
function that returns information regarding the current version of the APL
interpreter.  As is the case with all intrinsic functions, sapl.version must
first be bound to a name in the active workspace before it can be used.  This is
accomplished via the IFbind function in workspace 1 if.  For example:

            'sapl.version' IFbind 'ver'

binds the sapl.retcode intrinsic function to the name ver.

Right Argument:   The right argument of sapl.version must be an empty list.

Left Argument:    No left argument is permitted.

Result:           The result of sapl.version is a 4-element boxed list whose
                  elements are as follows:

                  0{result:   A character list whose value is the name of the
                              executable file containing the currently running
                              APL interpreter.

                  1{result:   A floating-point item whose value is the version
                              number of the currently running APL interpreter.

                  2{result:   An integer list whose value is the <quad>ts-style
                              timestamp of the release date of the currently
                              running APL interpreter.

                  3{result:   A character list whose value is the name of the
                              hardware platform upon which the APL interpreter
                              is currently running.

Examples:         )copy 1 if IFbind       � Bind sapl.version intrinsic.
           saved 1994-02-14-11:13:49
                  'sapl.version' IFbind 'ver'
           2
                  �ps�-1 1 3 3            � For pretty display.

                  ver ''                  � Display version information.
           ------------------------ -------- --------------------- ---------
           | /usr/sax/rel/bin/apl | | 4.03 | | 1994 2 14 0 0 0 0 | | SPARC |
           ------------------------ -------- --------------------- ---------

    �  X        ;  ;                 ------ "unix.filesync" documentation ------

   unix.filesync - [synctype] filesync files

The unix.filesync intrinsic function is a statically-linked, APL-style intrinsic
function that permits the APL interpreter's use of fsync() and/or sync() to be
controlled by the user.  APL uses fsync() or sync() to ensure that data written
to APL files is written immediately to disk rather than being buffered, since
the data can potentially lie in the buffers indefinitely before being written
to disk.  APL's choice of fsync(), sync(), or no synchronisation at all is
normally controlled by the start paramaeter -Yfsync, which is documented in the
environment manual.  The unix.filesync intrinsic function allows this parameter
to be altered during execution, and also allows the parameter to be set
differently for individual APL files.  As with all intrinsic functions,
unix.filesync must first be bound to a name in the active workspace before being
used.  This is accomplished with the IFbind (system.bind) intrinsic function
from workspace 1 if.  For example:

            'unix.filesync' IFbind 'fs'

binds the unix.filesync intrinsic function to the name fs.
 
Right Argument:   The right argument to unix.filesync must be either an integer-
                  valued list, or an empty list.  If the right argument is-
                  non-empty, each element is interpreted as an APL file tie
                  number.

Left Argument:    The left argument of unix.filesync, if present, may take
                  several forms, depending on the nature of the right argument.
                  If the right argument is empty, the left argument may only be
                  an integer-valued singleton array whose value is 0, 1, or 2.
                  If the right argument is a non-empty list, the left argument
                  may be an empty list. It may also be an integer valued list of
                  the same length as the right argument, where each element has
                  the value -1, 0, 1, or 2.  In this case the left argument may
                  instead be an integer-valued singleton array with a value of -
                  1, 0, 1 or 2, in which case it is treated as list of the same
                  length as the right argument with the same element repeated as
                  many times as necessary.

Results and
Side Effects:     If the left argument is elided and the right argument is an
                  empty list, there is no side effect and the result is an
                  integer item containing the APL interpreter's global filesync
                  setting, as follows:

                        0: Perform no file synchronisation.
                        1: Use sync() to perform file synchronisation.
                        2: Use fsync() to perform file synchronisation.

                  If the left argument is an integer-valued singleton array and
                  the right argument is an empty list, the result is the APL
                  interpreter's global filesync setting (as detailed above)
                  before the execution of unix.filesync.  As a side effect,
                  APL's new global filesync setting becomes the value of the
                  left argument.

                  If the left argument is an empty list, and the right argument
                  is an integer-valued list of tie numbers, there is no side
                  effect and the result is an integer list of the same length as
                  the right argument.  Each element of the result is the file-
                  specific filesync setting for the corresponding tie number in
                  the right argument.  In addition to the three global filesync
                  settings, there is an additional setting that can be applied
                  to specific files:

                        -1: Use global filesync setting for this file.
                         0: Perform no synchronisation on this file.
                         1: Use sync() to synchronise this file.
                         2: Use fsync() to synchronise this file.

                  If both the left and right argument are integer-valued lists
                  of the same length (though the left argument may be an
                  integer-valued singleton array), the result is an integer list
                  of the same length as the right argument.  Each element of the
                  result is the file-specific filesync setting, as detailed
                  above, for the corresponding tie number in the right argument,
                  before execution of unix.filesync.  As a side effect, the
                  file-specific filesync settings for the tie numbers in the
                  right argument are set to the corresponding values in the left
                  argument.

                  If the left argument is elided, and the right argument is an
                  integer-valued list, the result is a boolean list of the same
                  length as the right argument.  Each element of the result is
                  1 if the corresponding element of the right argument is a
                  valid APL file tie number, and 0 otherwise.  As a side effect,
                  an fsync() is performed upon all files tied to valid tie
                  numbers in the right argument.

When APL is started, its initial global filesync parameter is specified by the -
Yfsync parameter, which defaults to 2, if not specified.  Each APL file, when
tied or created, starts off with a file-specific filesync value of �1 (use the
global filesync parameter for that file).  These can subsequently be changed by
use of the unix.filesync intrinsic function.  It should be noted that a file is
exposed to a significant risk of data loss in the event of a UNIX crash if it is
not being synchronised.  However, synchronisation does make writing to a file
much slower, so an application doing many consecutive writes may often wish to
disable synchronisation for a specific file, and then perform explicit fsync()s
upon that file after a certain number of writes to the file.  This combines most
of the data security of automatic synchronisation with greatly improved
performance.
 

Examples:         )copy 1 if IFbind       � Bind unix.filesync intrinsic.
           saved 1994-02-14-11:13:49
                  'unix.filesync' IFbind 'fs'
           2
                  fs �0                   � Query global filesync value.
           2
                  0 fs �0                 � Turn off global syncing.
           2
                  2 2 fs 1 2              � Use fsync() for files 1 and 2.
           -1 -1
                  (�0) fs 1 2 3           � Query file-specific settings.
           2 2 -1
                  update 3                � Many writes to file 3.
           update complete
                  fs 3                    � Explicitly synchronise file 3.
           1
 X          hSystemErase 1 d0            �  �                    ------ "sapl.singleref" documentation ------

The sapl.singleref intrinsic function is a monadic function which returns
its argument unchanged as far as one can tell with APL primitives, ie
      � � singleref �
The result of singleref, however, is a separate copy of its right argument.
Other than the result of this function, there is no other place in the
workspace which references this data.  This is useful when writing applications
which call user-defined intrinsic functions, which may alter their arguments
as a side-effect to their execution.  The result of singleref may be safely
passed to an intrinsic function which will alter its arguments without any
exposure that the data itself may be referenced from multiple places in the
workspace.ef �   �        }  }  gs,              ------ "sapl.retcode" documentation ------

   sapl.retcode - [terminate] retcode code

The sapl.retcode intrinsic function is a statically-linked, APL-style intrinsic
function that enables the APL interpreter's return (or exit) code to be set
and/or queried.  When used dyadically, sapl.retcode also optionally causes APL
to terminate immediately.  As is the case with all intrinsic functions,
sapl.retcode must first be bound to a name in the active workspace before it
can be used.  This is accomplished via the IFbind function in workspace 1 if.
For example:

            'sapl.retcode' IFbind 'rc'

binds the sapl.retcode intrinsic function to the name rc.

Right Argument:   The right argument to sapl.retcode must be either an
                  integer-valued singleton array, or an empty list.  If
                  the right argument is non-empty, the single element must
                  be integer-valued, non-negative, and less than or equal
                  to 255.

Left Argument:    The left argument of sapl.retcode, if present, must be a
                  boolean-valued singleton array.  If the left argument is
                  elided, it is treated as zero.

Result:           The result of sapl.retcode is an integer scalar whose value
                  is the APL interpreter's return (or exit) code as it was
                  before sapl.retcode was invoked.

Side Effects:     If a non-empty right argument is supplied, the APL
                  interpreter's return (or exit) code is set to the value
                  of the right argument.

                  If the value of the left argument is 1, the APL interpreter
                  is terminated immediately, using the return (or exit) code
                  supplied in the right argument, or the most recently
                  supplied return (or exit) code if the right argument is
                  empty.  If the left argument is elided or has a value of 0,
                  execution continues normally.  Note that when a left argument
                  of 1 is supplied, APL terminates shortly thereafter, so that
                  the line of code that invoked sapl.retcode may or may not
                  complete execution before APL terminates.  The timing of APL
                  termination is somewhat unpredictable, though it will occur
                  before the next line begins execution.

                  The APL interpreter's return (or exit) code can be tested if
                  APL is invoked from a shell script, using the $? keyword
                  within the script.

Examples:         )copy 1 if IFbind       � Bind sapl.retcode intrinsic.
           saved 1994-02-14-11:13:49
                  'sapl.retcode' IFbind 'rc'
           2
                  rc �0                   � Query return code.
           0
                  rc 4                    � Set return code to 4.
           0
                  0 rc �0                 � Query return code dyadically.
           4
                  1 rc �0                 � Terminate with current code.
           interrupt
                  1 rc 99                 � Terminate with code 99.
           interrupt   1ft �          SaplRescode  ��            �myreport    �p           Xc                    P             Pand  16            �SaplSingleref P           Pverify           plzwe             �decribe                              �UnixFilesync   <           3 �SaplRetcode ouse           reoSaplVersion list    �        l  4   G               ------  "sapl.type" documentation  ------                                                                                                                                                                    sapl.type - r�[n] type argument                                                                                                            The righthand argument of sapl.type is any APL value (ie simple,      enclosed, package, etc). Note that it is *not* a name.                                                                                         The lefthand argument, if provided, is the length of the result to be returned. This defaults to the maximum, which is currently 3. Note thatthere is no execution penalty for longer results, but that the maximum length may change so if you plan to use an expression which relies uponthe length of the result you should specify an explicit length.                                                                                The result of sapl.type is always a (possibly empty) numeric vector,  the elements of which are described by the following table. Note that  element number �io+2, "storage class", is provided since it can be     useful in some applications, but it should be used as sparingly as     possible. Storage class is assigned at the whim of the system, and the storage class of an object may change in unexpected situations. Also,  of course, any code dependant upon storage class is highly             non-portable.                                                                                                                                   el#      �      0      �      1       �       2                        meaning  �  structure  �    type      � storage class                  ---------�-------------�--------------�-----------------------         values   � -1 package  � -1 package   � -1 package                              �  0  ?       �  0  ?        �  0  ?                                   �  1 simple   �  1 numeric   �  1 boolean    1 bit/el                  �  2 enclosed �  2 character �  2 integer    4 bytes/el                � -1 package  �  3 enclosed  �  3 floating   8 bytes/el                �             �              �  4 character  1 byte/el                 �             �              �  5 (unused)                             �             �              �  6 enclosed                             �             �              �  7 complex   16 bytes/el                                                                                                                                                   -------------Examples------------------------Commentary--------------                                      -                                                                      -                                     'sapl.type' IFbind 'type'        - Form IFN Bind named 'type'        2                                  - Bind successful                                                      -                                     type 'abc'                       - Check characters                  1 2 4                              -   simple, character, character                                       -                                     type �pack ''                    - Check package                     �1 �1 �1                           -   package, package, package                                          -                                     2 type <�3                       - Check characters                  2 3                                -   enclosed, enclosed                                                                                    �          2xSaplBindrep  2��           HExpand               SaplType                                        SaplTranslate       p     th R     G           ------  "sapl.translate" documentation  ------                                                                                                                                                                   sapl.translate - r�left translate right                                                                                                    The righthand argument of sapl.translate is an arbitrary-rank simple  character array, or a simple numeric array all of whose elements are inthe inclusive range [0-255].                                                                                                                   The lefthand argument, if provided, is a 256 byte character vector,   specifying the translation to be performed. If this argument is elided,�av will be assumed.                                                                                                                           The result of sapl.translate always has the rank/shape of the right   argument, and is always character. If a translation table is provided, one level of translation is performed.                                                                                                                                                                               -------------Examples------------------------Commentary--------------                                      -                                     'sapl.translate' IFbind 'xlt'    - Form IFN Bind named 'xlt'         2                                  - Bind successful                                                      -                                     xlt 86 87 88                     - Simple index into �av             abc                                -                                                                      -                                     (5��av) xlt 'abc'                - Translate them this time          fgh                                -                                                                                                                                                                                t p            SaplRowhash                   SaplRowmatch                  SaplPrsr            H	        '	  !   G               ------  "sapl.lzwe" documentation  ------                                                                                             sapl.lzwe - r� lzwe argument                                                                                                               'sapl.lzwe' is a monadic function whose argument is a character list  produced by 'sapl.lzwc'. Its result is a character list identical to   the original input to 'sapl.lzwc'. That is, 'sapl.lzwe' is the         inverse of 'sapl.lzwc'                                                                                                                                                                                                                                                                      -------------Examples------------------------Commentary--------------                                      -                                                                      -                                     'sapl.lzwc' IFbind 'lzwc'        - Form IFN Bind named 'lzwc'        2                                  - Bind successful                                                      -                                     �myreport                        - 'myreport' is char list           3707                               -   3707 chars long                                                    -                                     �c�lzwc myreport                 - Form compressed representation    1823                               -   of character list 'myreport'                                       -                                     4 2 � 1823�3707                  - What is the compression?          0.49                               -   can be more, can be less..                                         -                                     'sapl.lzwe' IFbind 'lzwe'        - Form IFN Bind named 'lzwe'        2                                  - Bind successful                                                      -                                     myreport � lzwe c                - Expand and verify c               1                                  -   yes, c is true rep. of myreport                                    -                                                                                                         on   H	          2xSystemFsm     ��    (     ru 	  /   G               ------  "sapl.lzwc" documentation  ------                                                                                             sapl.lzwc - r� lzwc argument                                                                                                               'sapl.lzwc' is a monadic function whose argument is a character       list. Its result is a character list which is a compressed version of  the argument. lzwc requires a workarea of about 75k bytes for tables.                                                                          'sapl.lzwc' is typically used by invoking it with a character list    right argument.                                                                                                                                The result is text compressed using an LZW algorithm. For a discussionof compression algorithms, including LZW-type algorithms, see                                                                                     Text Compression                                                       Timothy C. Bell & John G. Cleary & Ian H. Witten,                      Prentice Hall, 1990,                                                   ISBN 0-13-911991-4                                                                                                                         The intrinsic function "sapl.lzwe" will expand the result of lzwc     back into its orginal form. That is,                                                                                                                 myreport � lzwe lzwc myreport                                   1                                                                                                                                                                                                                    -------------Examples------------------------Commentary--------------                                      -                                                                      -                                     'sapl.lzwc' IFbind 'lzwc'        - Form IFN Bind named 'lzwc'        2                                  - Bind successful                                                      -                                     �myreport                        - 'myreport' is char list           3707                               -   3707 chars long                                                    -                                     �c�lzwc myreport                 - Form compressed representation    1823                               -   of character list 'myreport'                                       -                                     4 2 � 1823�3707                  - What is the compression?          0.49                               -   can be more, can be less..                                         -                                     'sapl.lzwe' IFbind 'lzwe'        - Form IFN Bind named 'lzwe'        2                                  - Bind successful                                                      -                                     myreport � lzwe c                - Expand and verify c               1                                  -   yes, c is true rep. of myreport                                    -                                   0 (            SaplLzwc                      SaplLzwe                     SaplFsm    �        �     G             ------  "system.bindrep" documentation  ------                                                                                                                                                                system.bindrep - create display form of IFN Bind.                                                                                           The righthand argument of system.bindrep is always a character vector (or scalar) containing the name of an IFN bind.                                                                                                The lefthand argument, if provided, is a numeric singleton, with a    value of 1 or 2. If 1 is supplied, the result will be a CR-delimited   character vector; if 2 is supplied the result will be a character      matrix. If this argument is omitted, '1' is assumed.                                                                                           The result of system.bindrep is a character display representation of the indicated IFN bind (see SystemBind for a description of the displayform). This is guaranteed to be a valid input to system.bind.                                                                                                                                                        -------------Examples------------------------------Commentary-----                                                -                                  IFrep 'IFrep'                       - Display IFrep bind.        system.bindrep                            -                            �� ifn bind, created 1991-03-11 22:08:24  -                                                                      -                                  �IFrep 'IFrep'                      - Check default shape        56                                        -                                                                      -                                  �2 IFrep 'IFrep'                    - Check matrix shape         2 40                                      -                                                                                                                                                                            �  �        �  V   G              ------  "system.bind" documentation  ------                                                                                                                                                                    system.bind - create IFN Bind, or query association level.                                                                                The righthand argument of system.bind is always a character vector    (or scalar) containing the name of a single apl user identifier        (reserved names are not permitted).                                                                                                            The lefthand argument, if provided, is a character vector or matrix   containing a valid IFN bind display (see below). Note that only line 0 ("group.function") of the display form is required by system.bindrep;  ie the vector " 'system.bindrep' " is a valid lefthand argument to     system.bind.                                                                                                                                   The dyadic call requires that the name be locally undefined, and      creates an IFN bind from the bind display. The monadic call is a query only; both calls return a single integer reporting the association     state of the named symbol.                                                                                                                     The association state describes the usability of an IFN bind.                                                                                         0     (monadic only) Means the symbol is not an IFN bind.                                                                                     1     The symbol is a valid IFN bind, but it refers to                       an IF that is not present in this system.                                                                                               2     The symbol is a valid IFN bind, to a known and                         available IF.                                                                                                                   Association state 1 is provided so that a system can construct and    process IFN binds for/from other systems with a different set of       available IF routines. An attempt to use an IFN bind whose association state is not 2 will result in an "association error" being signalled   (event number 10).                                                                                                                                                                                                            ------  IFN bind display representation  ------                                                                                       An IFN bind may be a CR-delimited character vector, or a character    matrix; in either case it is regarded as a series of lines with the    following interpretation:                                                                                                                       ---------------------------------------------------------------        - Line  - code - Example (using a bind to "system.bind")      -        ---------------------------------------------------------------        -   0   -  nn  - system.bind                                  -        -   1   -  tc  - �� if bind, created 1990-02-12 22:26:48      -        - 2-n   -  uc  - �  bind performed during IFNHACK tests by LOC-        ---------------------------------------------------------------                                                                                                                                                     nn  Line 0 is always and only the group.function name of the Intrinsic     Function to which the bind refers. This routine may or may not         exist on the system doing the bind, see "association state" above.                                                                        tc  This line identifies the bind type (only IF bind is currently          possible) and reports the time that the bind was created. Note         the double '�' symbols in this line; these distinguish this            line from user commentary.                                                                                                                uc  Any bind may include supplied user commentary text. This text          is maintained as part of the bind data structure and will always       be returned as part of the display form by system.bindrep.             Note that user commentary begins with a single '�' symbol. This        symbol is required; lines beginning with two such symbols will         not be included as part of the user commentary.                                                                                            Note that the definition of line codes tc and uc result in the       preservation of user commentary intact across display/rebind           operations.                                                                                                                                                                                                          -------------Examples------------------------Commentary--------------                                    -                                       'system.bindrep' IFbind 'brep' - Form IFN Bind named 'brep'          2                                - System reports association level 2                                   -                                       IFbind 'brep'                  - Check association level             2                                - Still 2                                                              -                                       x�brep 'IFbind'                - Get display form of IFbind            x IFbind 'bind'                - Try another bind to same IF         2                                - It worked                                                                                                                                                                          �            SaplBrowmatch               �SystemDef  "�(    �        �     G           ------  Intrinsic Function (IF) Introduction ------                                                                                    An Intrinsic Function (IF) is a formally defined functional routine   (ie, it takes arguments and produces results) whose definition is part of the APL system ("intrinsic"), but which does not have any           permanently assigned symbol (such as "+" or "�read"). Such a routine   may therefore be accessed only by associating it with a symbol in the  workspace; such an association is called an "IFN Bind".                                                                                        An IFN Bind (abbreviated in places to just IFN or Bind) is the        embodiment of an association between an APL symbol and an Intrinsic    Function. A Bind is a physical object, resident within the APL         workspace, which may be created via the 'system.bind' IF, displayed by the 'system.bindrep' IF, saved along with the workspace, copied, and   erased like most other workspace objects.                                                                                                      Syntactically, an IFN most closely resembles an ambivalent, locked,   APL function. Although it can be displayed via the 'system.bindrep' IF,it has no canonical display (�cr, 1 or 2 �fd), and can not be          interrupted or suspend. The display form of an IFN Bind may contain    user commentary; the output from system.bindrep is valid as input to   system.bind.                                                                                                                                   Note that the namespace in which IF names exist is tree-structured.   There are at present two levels in this tree, so IF names may be       interpreted as "group.function". The number of groups is likely to     remain rather limited, but will always include the group "system", in  which IFs that are considered to be a permanent part of the base systemare found. Examples of such IFs are "system.bind" and "system.bindrep".                                                                                                                                                 �           QLX        X         ;   ;      G�(2=���pnames�sp)/'�(2=''QLX1''�pnc�sp)/''�pdef�sp��QLX1''' X            intro i            3�SystemBind  4 3             3pSystemBindrep              3�describe ad � 1             3�SaplBinrowma        0                Ty�QLX�describe    3�`0             SaplBrowhash        0                    system.bindrep      0   (              -25 1�+        (          x    ����                                 0                  Э%@ �%@(�%@@�%@    0            IFrep      (                    system.bind (   (                  �Ҝ+        (                ����                                 0                  ��%@Ю%@��%@�%@    0         .s IFbind `   �       d   d           �S%@�b%@                                                    �%@                                                                                                                                                                                                                                                            �R%@                                                                                �  (                   .,**_�      (                                        3�binds      �       e                 `�%@0�%@       ��%@`�%@       p�%@%@        @�%@��$@        �%@��%@       x�%@��%@         �%@��%@         �%@Ђ%@        `�%@            ��%@            ��%@            ��%@            x�%@Pu%@        ��%@�k%@        �k%@            �k%@            �k%@            �b%@c%@        �b%@ T%@       �b%@            0u%@            �S%@�%@       �S%@�E%@        �S%@`'%@        pS%@            S%@�B%@        �R%@            XS%@            �R%@            �b%@           S%@            @S%@            �R%@            �%@��$@        ��%@ �$@       %@            �%@           �B%@H%@        0%@�%@       0%@H%@       �%@h%@       ��$@��$@        ��$@p�$@        P�$@0�$@       �$@��$@        ��$@��$@    -   ��$@p�$@        P�$@8�$@        0�$@�9$@      H�$@            0�$@            �$@             �$@            ��$@            ��$@            ��$@            x�$@           X�$@H<$@      ��$@        5   8�$@�$@        �$@��$@        ��$@��$@        ��$@�>$@       ��$@           ��$@           h�$@��$@       Ȓ$@�?$@      h�$@           P�$@        6   0�$@xA$@       ȋ$@            ��$@            P�$@            �p$@            pp$@            h�$@�G$@    :   Pp$@��$@        0p$@�p$@    !                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   �  �       d         .   7       8   /      9   N      ;   4   E   2       #       @   M   $   3                     %          
   	   D   L       1                 >   &          =      (                                ?   B   "                   G   H   I   J   K       F       C   )           *               +           <       0               '                                          ,   A   �  