      � ��0�\   { t0   2�� � 0� 0l@0�    0��0�L0�L0�0�,0�        0tP����=0         
0tp    0�`0�@0� 0s�0�`   �  A�����        0��0t�    0����������       0t(   P0t0�0�p       f                                        0�0q`   0s                          0]�    0]�     E�                    H�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    H   56�   2        �s�� ( ' * +       	  ) ک/'ws   H               �ERR   bo         H      ERR2:�host 'put'�wsfile�ov�3 � undo Version change 0c�   H   (           �0�z�(~'  '�z)/z      (   @      ERR: z�msg,z,'. ',wsfile,' not backed off'         @   @      bod1:�0�z�'No back-off required for: ',wsfile      @   (          �0�z�(~'  '�z)/z       (   (      bod:z�'Backed off: ',z     (          o  0lX      @         z�(~z�(10 13 {�av))/z� apl ')save ',wf          @   (         �apl ')drop ',wf        (   @         �ERR2�ک/'ws full'� apl z�')copy ',wf,Q         @   P   r��   Q�' �io �pw �ct �pp �ps �trap �lx �er �fc �ht �PR �rl '         P   @         �ERR2�ک/'ws full'� apl z�')copy ',wf           @   (         wf�'�' (wf='=')/}wf �   (   (   hot   wf�'�' (wf='+')/}wf     (   0         wf��3�(wsfile�' ')/wsfile 3     0   @         �ERR2�ک/'ws too large'�apl z�')clear ',�sz 2   @   @         sz�256��av�host 'get'�wsfile�4 32  � �io�0 cl   @   8         �host 'put'�wsfile�(,28{�av)�3 pl z�'   8   @   3�w   �bod1��(29{�av)=ov�host 'get'�wsfile� 1 3 tra   @   (   c hSv:�Sv�ڢ1��svn cl�cl+1    (   (   '�amsg�'Error in: ' Q         (   8      �trap�'� 0 c �ERR �msg�0{�er�z��0'         8   (       wsfile�wsfile,'.sw'  {�   (   0   ')a�(�/'.sw'�wsfile)/1+�lc            0   @      �cl��1�wsfile�(wsfile�' ')/wsfile � ��'.'   bod:   @   8   f:'z�bo wsfile;cl;Q;�trap;�io;sz;msg;ov;wf    8  h     2���    ��  0q�0l@   0q�       0q`       0q8     z�0q      ff0p�     fo0p�     e 0pp       0p8     z�0o�     	,w0o�     
t 0o�     ' 0o`       0o8       0n�      '0n�       0nh       0n@       0n       E0m�     'p0m�     �o0m�      V0mX     ng0m       0l�     R 0l�       0l�                  h                           wf                 ov                  ERR2              Xsz  u�          0�      1�fd'bo'                                       (                .,**_�         (                                              '   msg                                      �   to    h   hGE:
Please Do NOT Resave this Workspace.
This workspace must be retained in the format used prior to SAX 4.7 ext   �        (msg                        Ws: BOws

This workspace may be used to convert SAX 4.7 workspaces to the format used
by earlier SAX versions.   The conversion is accomplished by changing the
version number stored in the workspace and then )copying the contents of the
workspace and )saving as the given workspace name.

The workspace may not be )loaded after the version number is changed in the
workspace and before it is )saved.

IMPORTANT:
Retain this workspace without converting to the SAX 4.7 format.  The back-off
must be performed with a version of the SAX interpreter prior to 4.7.

USAGE:

      bo wsfile
          Backs-off a single workspace in path format with or without the
          .sw extension.

      f directory
          Uses the Unix command find(1) to locate files with a .sw extension
          in 'directory' and applies bo to the files.  Note:  f recursively
          descends into 'directory'.  To apply bo only to those file in
          'directory' itself, try:

      (z=10{�av) �1�bo z�(10{�av),host 'ls ',directory,'/*.sw'        (    �          $ %  �   (         c                 i                    Describe $             (    ,8z�bo�1 > findws �        (         i��1          X     1�W�    ��  0}(0yp   0z       0z�     100y�      �         ve '   X        f 0  `      (    �          !�� "         (   (    ,�c:�c�ڢ1=�svn i�i+1        (         lf                dir           (     8z�(,�/(<'.sw')��> z)/z     (   0     �z�(~z��)/z� (z=lf) �1�<z�lf,z +�   0   @      z�host 'find ',dir,' -name \*.sw -print '     0   @   (    �lf�10{�av � �io�0        (   `    1��P    ��0|�0z� ��0{�     O0{p     ܸ0{@     40{      �           `      wokfindws t      8    ue   "               onvers   8      plsKeep y c         vesJust umb          teRef kspa         )cpSet  the      (     z�findws dir;�io;lf        (      woksav e na             z�f �;i        
       0    ;�       �('' � sav) � Ref   0   )   0        ;h Keep: ���,sav         @    ;�       ('Host error ',�> 0{sav) �signal 541 {      @   0    ;�       �((,<0)� 1�sav)�Just        0   8    ;�  Ref: �(sav � �sav��var) � Keep   

  K   8        ;� �var,'��' 'v               ;�  Set: ��''  v         0    ;�       �0 1 1 1 �svc var           0   X    :�       ('Cannot share ',var) �signal (0�(>,<sav,11 0) �svo var)�11 s   t   X   0    ;        �(0 = �svo var) � Set       0   H    ;�       var�'HOST',�sav��,>(2=�nc'SOX'){'�0'�'SOX'          H   0    ;�       � (2=�nc'�')/'SOX��'  ;w�   0   8    ;h     � Execute one Host AP request      8   �    �,�    ���0��0|P �0�     �0�       08     si0     ,<0~�     �s0~�     
[0~`       0~@     sv0~     	  0}�     
' 0}�     '
0��     f:0}x     sa0}H      Ke           �        Xhost        H       6 	         ��    	           '   H      orsOff  may         covBreak            estOn (   (         ��1Display            Receive            Send yc           (Command       0    :�         �� � host � ;sav;var w�   0      1�zvar z +�            off st '          -anum *.sw           0now    (         0{alin �io�           `�             �� x ��          P�    ܸ      (    : Just: sav�> 1{sav   ;�   (       <p �0    f           ;` ��ex  var     [       0    ;0    Off: �var,'�0 0 4 0{�av'   �   0       ;h �0    f           ;� now�� var  ow
        0    ;�  Break: �var,'�0 0 2 0{�av'       0        ;( �Command                <p ��''  O          ;� off�0        (    <`     On: �off�0          (   0    <8         �(6{num)�Receive 79 110   0        ;� �(3{num)�On          0    ;�         �(6>�now)�Display         0        ;� now�lin�now           (    <H         ���,6�lin�now     (   (    <p num�(8�2)��av�5{now   
   (   8    ;�         �signal (0=�av�4{now)�11   apl    8   0    ;xDisplay: lin�256��av�2�now        0   (    <`Receive: now��var  '
v �   (       ;� �now�0       8    ;0         �var,'�(0 0 0 0{�av),�'   
apl    8        ;� ��now�� ){�av         (    ;�   Send: now�'�'=1��      (   H    ;8         �((')break'�')off')�<now) { Break, Off, Send  x   H   0    ;Command: now�(� � ' ')/�   ]@S�    0        ;x �Receive              0    ;`         �0 1 1 1 �svc var   <e(   0   X    ;h         ('Cannot share ',var) �signal (0�(>,<num,1 0) �svo var)�11 ]      X   0    ;H �(off�0=�svo var)�Command   <e(   0        ;�         ��''  *       H    ;�         var�'APL',�num��,>(2=�nc'SOX'){'�0'�'SOX'         H   8    ;�       � Send one line to an S-Task 0   8   @    ;`             �� � apl �;lin;now;num;off;var;�io    @  �    #X,��    ��  0�00��   0��       0�8       0��       0��       0��       0�`       0�       0��       0��       0��       0�@     	  0�     	  0��     
  0��     
  0��       0��       0�P       0�       0��       0��       0��       0�x       0�X       0�(       0�        0��       0��       0��       0��       0�`       0�H       0�       0��       0��                  �      2 {apl               ;�ERR �0            <`bod1 On:           bod    0            Sv 6{num      (    ;� �(2=�nc'�')/'SOX��'       (        0Q   ;�         >�ocl Displ            wsfile �            z      (           ;H         �io�0            �a�bo         �        d   d        0sp                                                                                                                                                                                                                                                                                                                                                                                                              �                                                                                                                                	�$��[]();/\�����+-��*���^�<�=�>������,!����?~������_����������ܭ�����}{��abcdefghijklmnopqrstuvwxyz�ABCDEFGHIJKLMNOPQRSTUVWXYZ�0123456789.� ':�
���������������������������������|`#@"����%&��徼�������е�����뱿��������                           	
 !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~��������������������������������������������������������������������������������������������������������������������������������                                       ����               ����                                 �                                                                                                0��                                                                 X               0��0��0��0��0�p0�X0�@0�(0�0��0��0��0��0��       X                             �     e                 0�X0r       0�             0�            0��            0��            0��            0��           0�h            0�P            0�80�p       0��            0��            0�p            0�X            0�@            0�(            0�           0��            0��            0��            0��           0�h            0�P            0�8            0�             0��0�       0}            0|�           0|�           0|�           0|�           0|80{�       0{             0z�            0z�0z(       0y�            0y�            0y�0uP       0u80t�        0s�            0s�           0s�           0s�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              �  �     d       &   #          $                 "                          
       !       +                    '       *              	              (                                                                                                                                                                                  )                                                           %  �