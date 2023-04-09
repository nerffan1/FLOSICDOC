==================================
Exchange correlation functionals
==================================
The exchange-correlation functional is specified in the CLUSTER and/or SYMBOL files. The user can currently choose to use LDA (PW92 version) or PBE functionals. The functional string needed to run them is as follows:

LDA-PW91*LDA-PW91

GGA-PBE*GGA-PBE

If the user wants to run GGA-PBE exchange-only, for example, the string will be :

GGA-PBE*GGA-NONE  
