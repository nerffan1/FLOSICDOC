.. _nrlmolinput:

==================================
Controlling a calculation: the NRLMOL_INPUT.DAT file
==================================

The **NRLMOL_INPUT.DAT** is an auxiliary input file that allows setting of control parameters for calculation.  If it does not exist, then it will be 
created by the FLOSIC executable using default values.

The NRLMOL_INPUT.DAT with default values of parameters as of today (August 15, 2019) is given below. 


.. literalinclude:: ../input_files/nrlmolinput.file


A large number of entries related to calculation of certain properties are given as yes or no. Here **N** means *NO*. If **Y** then the calculation of a given property is requested. Note that certain calculations such as, for example, the calculation of joint density of states is often useful only at the final converged geometry.

Most of the variables are already explained briefly in the NRLMOL_INPUT.DAT file. Below we add some comments on a few of them.

    #. ATOMSPHV: Set to **Y** to calculate charge and spin charge in each inequivalent atom integrated over a sphere of specified  radius.

    #. BASISV: Default value is **DEFAULT** which refers to the NRLMOL basis optimized for the PBE functional. 
       This variable specifies which basis set is to be used. Users interested in using standard sets from the literature should look up basis.txt in the basis 
       subdirectory of the directory containing the source files. This file lists all the basis sets available. The user 
       needs to specify only the first string before the "." from the entries in basis.txt. For example, if the user 
       wants to use 6-31G basis then he should replace DEFAULT with 6-31G.


  
    #. CALCTYPEV:   Default is **LBFGS**. 
       Available choices:  **SCF-ONLY**, **CONJUGATE-GRADIENT**.

            *  **SCF-ONLY** This choice is used when the user is not interested in an atomic geometry optimization. Atomic forces are not computed with this setting.
            *  **CONJUGATE-GRADIENT** : Atomic geometry optimization is done using the conjugate-gradient algorithm.
          
         


    #. DIAG1V        =   Default is **1**  
       This variable allows different diagonalization algorithms to use for  diagonalization of the Hamiltonian. 
            The options for this variable are:
            0)  DSGVX (LAPACKL: computes selected eigenvalues, and optionally eigenvectors). 
            1)  DSGVD (Default if matrix size is below 100).  Uses a divide and conquer algorithm to compute eigenvectors.
            2)  DSGV   (This is the slowest of the available) option.



    #. DIAG2V        =    Default is **1**
       This variable allows diagonalization of the Hamiltonian using packed storage format for memory savings. This is useful for large system sizes.
      
          Available options are:
           
            0)  DSPGVX (LAPACK: computes selected eigenvalues, and optionally eigenvectors). 
            1)  DSPGVD (Default if matrix size is below 100).  Uses a divide and conquer algorithm to compute eigenvectors.
            2)  DSPGV (QR- factorization. This is the slowest of the available) option.  

          The option 1 (DSPGVD) is the fastest if all eigenvectors are required otherwise use the default 0.
          Note that FLOSIC doesn't use **SCALAPACK** 

 
    #. POPULATIONV   = Default is **N**
       When it is set to Y, Mulliken and Lowdin Population analysis calculations are run. Note that this is available only for spin polarized calculations.

    #. RHOGRIDV  = Default is **N**
       When set to Y,  it will generate a CUBE file for visulaization of total and spin density (spin up - spin down).             
            
    #. SCALEDLBFGSV  = Default is **Y**
       This indicates the FOD optimization algorithm. Here scaled LBFGS is set as the default FOD optimization routine. Conjugate Gradient is used when this option is set to ‘N’.

   

   

