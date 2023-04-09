.. _usymgen:

==================================
Basis sets: the ISYMGEN file
==================================


The basis set information is in the ISYMGEN file which is created when you run FLOSIC. 
This file contains the basis set for each atom type appearing in the calculation. For each orbital of a given atom, same set of primitive Gaussians is used. For example, the default basis set for carbon is written as below :

The following is the Pederson-Porezag[3] (NRLMOL default) basis in the  **ISYMGEN** .  The FLOSIC code
allows use of other basis sets such as : 6-31G*, 6-311G**, STO-3G, TZVP, DGDZVP etc.
For a full list of available basis sets, see the file basis.txt (PATH_TO_FLOSIC/basis/basis.txt).
The Pederson-Porezag (NRLMOL default) is specially optimized for the PBE functional, and roughly corresponds to quadruple zeta quality.


.. literalinclude:: /_static/input_files/flosic_carbon_isymgen.file

 
Here, the second line specifies the nuclear and electronic charges in the atom. The nuclear and electronic charges specifies the actual atom (e.g. Nuc charge = 6 for carbon) but the electronic charge depends on whether all electron or pseudo potential calculations are used (e.g. for carbon it would be 6 for all electron and 4 for a pseudopotential calculation)

The third line specifies the type of calculation :

ALL for all-electron, BHS for BHS pseudopotential, TAB for tabulated user-supplied pseudopotential.

The third and fourth lines specify the number of total such atoms in the geometry 
and their symbols in the SYMBOL file. EXTRABASIS =1 in SYMBOL file will signal 
the program to use the supplementary basis functions. Then comes the number of 
primitive Gaussians followed by the number of the s, p and d -type contracted 
Gaussians. The number of supplementary functions of s, p and d type are written next. 
These informations are followed by some blocks of numbers. The first block lists the 
exponents of the primitive Gaussians. This is then followed by Ns blocks where Ns 
is the number of contracted s-type Gaussians. The first block is the coefficients 
multiplying the primitive Gaussians for the 1s contracted Gaussian, the second block 
is for 2s Gaussian and so on. After the Ns number of such blocks, comes the Np blocks 
corresponding to the p-type contracted Gaussians followed by similar Nd number of d-type Gaussians. In the example for carbon atom above, the 1s and 2s contracted Gaussian is a linear combination of the all the primitive Gaussians whereas the higher unoccupied s orbitals are taken as single long-range Gaussians. Similarly for p orbitals where only the 2p orbital is occupied. These are then followed by similar blocks corresponding to the supplementary functions.
By setting EXTRABASIS = 1 in the SYMBOL file, the additional basis functions described above are added to the calculation.  These are sometimes added when calculating dipole moments and polarizabilities.  
