
Exchange-Correlation functionals
##################################
The exchange-correlation functional is specified in the :ref:`CLUSTER` and/or :ref:`SYMBOL` files. The user can choose to use **LDA**, **GGA**, 
and **MGGA** functionals. Here is a table with recognized functionals:

+------------------------------------------------+
|                   Functionals                  |
+========+===========+=========+========+========+
|  RPA   |   WIGNER  | GUNLUN  |  PW91  |  PBE   |
+--------+-----------+---------+--------+--------+
| REVPBE |    RPBE   |   B88   | SCAN   |  MSCAN |
+--------+-----------+---------+--------+--------+
| RSCAN  |   R2SCAN  |  PBEIBP |        |        |
+--------+-----------+---------+--------+--------+

How to input the functionals?
*****************************
The functional string are composed of their type, followed by a dash (-), and followed by their name.For example,
:code:`LDA-PW91` or :code:`GGA-PBE` can be written in the input files. 

Additionally, the functional for exchange and correlation can be specified individually. The asterisk (*) separates 
the functionals. For example, :code:`LDA-PW91*LDA-PW91` says to use PW91 on both the Exchange and Correlation.

If the user wants to run :code:`GGA-PBE` exchange-only, for example, the string will be :code:`GGA-PBE*GGA-NONE`  
