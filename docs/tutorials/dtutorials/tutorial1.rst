============================================================== 
Tutorial 1: Molecular geometry optimization at the DFT level
============================================================== 

Very simple  tutorial  to get acquainted with electronic structure calculations using FLOSIC. This tutorial will explain how to run FLOSIC for molecular 
geometry optimizations using DFT. 

The CLUSTER file is the main input file of FLOSIC. It contains the minimal information to set up a calculation. For this tutorial, we will use a CH4 molecule, which 
uses a **CLUSTER** file like the one shown below:

.. literalinclude:: input_data/CLUSTER.CH4

We will now describe the input structure of this file.

The first line is **GGA-PBE*GGA-PBE**. 
It means that the exchange-correlation interactions in the systems are modeled within the generalized gradient approximation (GGA) 
using the Perdew-Burke-Ernzerhof (PBE) parametrization. This is the default functional used in NRLMOL. A few other functionals are 
also available.

The second line is **NONE** . 
It refers to point group symmetry of the molecule. For the purposes of the tutorial, we will not enforce symmetry. If you would 
like to use symmetry, a symmetry (TD,OH, etc.) can be selected in place of **NONE**. In these cases, the code will create a GRPMAT 
file containing the appropriate symmetry operations (each represented by a 3x3 matrix).  If you would like to use symmetry operations 
directly from an existing GRPMAT file, replace **NONE** with **GRP**. 

The third line contains **5**. 
It specifies the number of inequivalent atoms in the calculation. We're running a CH4 calculation. So the number of atoms is 5 (1 C and 4 H).
 
The line following third line contains the cartesian position in atomic units of the Carbon atom. Following the xyz coordinates is the atomic charge. The example listed is for Carbon whose atomic number is 6. The string ALL means include all 
(that is 6 in this case) electrons into the calculation.
The next 4 lines are the hydrogen atoms, which follow the same format.

The ninth line in the example file has two fields, charge and moment. The first field is **0.0** which means to perform the calculation for the neutral molecule. 
If it is **1** then the calculations will be performed for a cation of CH4. The next field which is also **0.0** 
in this example corresponds to the number of unpaired electrons in the system. CH4 is a closed shell system, so it has no unpaired electrons.
Lines after the Charge and Moment line are ignored.

Now, create an empty directory and execute the code inside of it. Multiple files should be created, including a CLUSTER file. Copy the input from this example into the file called CLUSTER, replacing the default text. 
Change the CALCTYPE option in the NRLMOL_INPUT.DAT file to "LBFGS" and run the calculation for CH4. 

    $ **PATH_TO_FLOSIC/nrlmol_exe**

Open the **GEOCNVRG** file. If you have done everything correctly then it should be **-40.466969** Hartree.

A new atomic geometry will be appended to the SYMBOL file. SYMBOL is created from the data in CLUSTER. The new geometry was created by a gradient optimization 
routine (either LBFGS or CONJUGATE-GRADIENT). The file **FRCOUT.G0** contains the atomic forces for the previous atomic geometry. Running 
the code again will carry out a calculation at the updated molecular geometry and a new total energy and new atomic forces will be computed. A new
update of the atomic coordinates will also be written into SYMBOL. Repeating this process several times will result in a local minimum energy geometry to be 
reached. This happens when the maximum force falls below the criterion set in GEOCNVRG.
