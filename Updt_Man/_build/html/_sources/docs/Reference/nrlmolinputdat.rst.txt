.. _nrlmolinput:

=====================================================
Controlling a calculation: the NRLMOL_INPUT.DAT file
=====================================================

The **NRLMOL_INPUT.DAT** is an auxiliary input file that allows setting of control parameters for calculation.  If it does not exist, then it will be 
created by the FLOSIC executable using default values.

The NRLMOL_INPUT.DAT with default values of parameters as of today (August 15, 2019) is given below. 

.. literalinclude:: /_static/input_files/nrlmolinput.file

A large number of entries related to calculation of certain properties are given as yes or no. Here **N** means *NO*. If **Y** then the calculation 
of a given property is requested. Note that certain calculations such as, for example, the calculation of joint density of states is often useful only at the final converged geometry.

Most of the variables are already explained briefly in the NRLMOL_INPUT.DAT file. Below we add some comments on a few of them.

ATOMSPHV
-------------

Set to **Y** to calculate charge and spin charge in each inequivalent atom integrated over a sphere of specified  radius.

----------------------------------------------------

BASISV
-------------
 
This variable specifies which basis set is employed.  The ``'DEFAULT'`` basis is the NRLMOL Basis, optimized for the PBE functional

Other bases are available in the **basis.txt** file, found in the **basis** 
subdirectory. This file lists all the basis sets available.

The following bases are available:

+-------------------------+--------------------------+-----------------------+--------------------------+
| 3-21G                   | 6-31G-Blaudeau           | Ahlrichs_TZV          | Partridge_Uncontracted_1 |
+-------------------------+--------------------------+-----------------------+--------------------------+
| 3-21Gs                  | 6-31Gs                   | Ahlrichs_VDZ          | Partridge_Uncontracted_2 |
+-------------------------+--------------------------+-----------------------+--------------------------+
| 3-21GSP                 | 6-31Gs-Blaudeau          | Ahlrichs_VTZ          | Partridge_Uncontracted_3 |
+-------------------------+--------------------------+-----------------------+--------------------------+
| 3-21Gs_Polarization     | 6-31Gs_Polarization      | DZVP2                 | Partridge_Uncontracted_4 |
+-------------------------+--------------------------+-----------------------+--------------------------+
| 3-21ppG                 | 6-31Gss                  | DZVP                  | Saddlej                  |
+-------------------------+--------------------------+-----------------------+--------------------------+
| 3-21ppGs                | 6-31Gss_Polarization     | GAMESS_PVTZ           | STO-2G                   |
+-------------------------+--------------------------+-----------------------+--------------------------+
| 6-311G                  | 6-31pGs                  | GAMESS_VTZ            | STO-3G                   |
+-------------------------+--------------------------+-----------------------+--------------------------+
| 6-311Gss                | 6-31ppG                  | Huzinaga_polarization | STO-3Gs                  |
+-------------------------+--------------------------+-----------------------+--------------------------+
| 6-311Gss_Polarization   | 6-31ppGs                 | IGLO-II               | STO-3Gs_Polarization     |
+-------------------------+--------------------------+-----------------------+--------------------------+
| 6-311pGs                | 6-31ppGss                | IGLO-III              | STO-6G                   |
+-------------------------+--------------------------+-----------------------+--------------------------+
| 6-311ppG2d2p            | Ahlrichs_Coulomb_Fitting | McLeanChandler_VTZ    | TZVP                     |
+-------------------------+--------------------------+-----------------------+--------------------------+
| 6-311ppGss              | Ahlrichs_Polarization    | MIDI_Huzinaga         |                          |
+-------------------------+--------------------------+-----------------------+--------------------------+
| 6-31G                   | Ahlrichs_pVDZ            | MINI_Huzinaga         |                          |
+-------------------------+--------------------------+-----------------------+--------------------------+

The user only needs to specify the string preceding the *.basis* extension in the input file. For example, 
if the user wants to use 6-31G basis then he should replace :code:`'DEFAULT'` with :code:`'6-31G'`.

----------------------------------------------------------------------------------------------------------------------------

CALCTYPEV
-------------
 
Available choices:  

* **SCF-ONLY**: This choice is used when the user is not interested in an atomic geometry optimization. Atomic forces are not computed with this setting.
*  **CONJUGATE-GRADIENT**: Atomic geometry optimization is done using the conjugate-gradient algorithm.
*  **LBFGS** : ...WIP...

----------------------------------------------------------------------------------------------------------------------------

DIAG1V
-----------------------

This variable allows different diagonalization algorithms to use for  diagonalization of the Hamiltonian.

The options for this variable are:
   #.  DSGVX (LAPACKL: computes selected eigenvalues, and optionally eigenvectors). 
   #.  DSGVD (Default if matrix size is below 100).  Uses a divide and conquer algorithm to compute eigenvectors.
   #.  DSGV   (This is the slowest of the available)

----------------------------------------------------------------------------------------------------------------------------

DIAG2V
---------------------

This variable allows diagonalization of the Hamiltonian using packed storage format for memory savings. This is useful for large system sizes.
Available options are:
#. DSPGVX (LAPACK: computes selected eigenvalues, and optionally eigenvectors). 
#. DSPGVD (Default if matrix size is below 100).  Uses a divide and conquer algorithm to compute eigenvectors.
#.  DSPGV (QR- factorization. This is the slowest of the available) 

The option 1 (DSPGVD) is the fastest if all eigenvectors are required otherwise use the default 0. 

.. note:: 

   FLOSIC does not use **SCALAPACK**

----------------------------------------------------------------------------------------------------------------------------

POPULATIONV
--------------------------

When it is set to Y, Mulliken and Lowdin Population analysis calculations are run. Note that this is available only for spin polarized. 

----------------------------------------------------------------------------------------------------------------------------

RHOGRIDV
------------------------

When set to Y,  it will generate a CUBE file for visulaization of total and spin density (spin up - spin down). 
