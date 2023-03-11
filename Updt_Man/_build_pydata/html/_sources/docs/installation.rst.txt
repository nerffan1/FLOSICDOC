================================
Installation Guide
================================

Obtaining the Code
--------------------

The code is accessible from a GitHub repository. To download the latest version, use a git command as follows:

.. code-block:: bash

        git clone https://github.com/FLOSIC/PublicRelease_2020.git

Prerequisites
--------------------

The following modules are needed to be able to compile the FLOSIC
        - OpenBLAS 

Compilation
--------------------

Once you have obtained the code from the repository, go to the directory containing the source files.  You will
need to edit three blocks of lines in the makefile to suit your needs.

.. note:: 

        If you have not modified a Makefile before - no worries!
        You only have to switch a few variables.

**First block: parallel or serial**

.. code-block:: bash

        # set Y or N 
        # Parallel compilation
        MPI=Y
        # Group calculation     
        GROUP=N

In this block, the user specifies whether the compilation will be for a parallel :code:`MPI=Y` or serial :code:`MPI=N` version of the code.
When using a parallel version :code:`MPI=Y`, the user can choose to use a multi-level parallel scheme by setting :code:`GROUP=Y`.
This parallelizes over the orbitals in calculating SIC potentials, and also over the grid points.  
This option can deliver a greater speed up than the single-level parallel scheme, but it is not recommended for new users.

When :code:`GROUP=Y`, the user should edit the "igroup" file in the run directory.  This file should contain an integer that is
an even divisor of the number of orbitals. For example, for 100 orbitals, igroup might be 10 or 20, but not 15.  

**Second block: compiler choices**        

.. code-block:: bash

        # COMPILERS
        CC = gcc 
        FC = mpif90 
        FFF = mpif90 
        # COMPILER FLAGS
        CFLAGS = -O3 -mcmodel=medium 
        FFLAGS = -O3 -mcmodel=medium 
        LFLAGS = -O3 -mcmodel=medium

The second block is to specify the compilers and their flags used during the compilation. A number of routines require
static allocation of arrays. The code needs to be compiled for appropriate array sizes for the system under study and 
these static parameters are listed in the file called PARAMA2 (*vide infra*)   

An example of the compilers used for NERSC is below.

.. code-block:: bash

        CC = cc
        FC = ftn
        FFF = ftn

**Third block: linking options**

# Linking options

.. code-block:: bash

        $(FFF) $(LFLAGS) $(OBJ) -o $(BIN) -llapack -lblas $(LIBS)

This block specifies the libraries used for linking, where it is recommended to use optimized BLAS and LPACK libraries if they are available on your platform to achieve the best performance.

Edit **PARAMA2** for static parameters :

+--------------+--------------------------------------------------+
| **Parameter** | **Brief  explanation**                          |               
+==============+==================================================+
|  *MAX_PTS*   | maximum size of integration grid                 |
+--------------+--------------------------------------------------+
|  *MX_SPH*    | needed to generate the integration mesh          |
+--------------+--------------------------------------------------+
|  *MAXUNSYM*  | maximum number of orbitals for an atomic basis   |
+--------------+--------------------------------------------------+
|  *NDH*       | maximum total basis set size                     |
+--------------+--------------------------------------------------+
|  *NDH_TOT*   | maximum number of Hamiltonian matrix elements    |
+--------------+--------------------------------------------------+
|  *MAX_OCC*   | maximum number of occupied states                |
+--------------+--------------------------------------------------+
|  *MX_GRP*    | maximum size of symmetry group                   |
+--------------+--------------------------------------------------+


An example for serial compilation on a laptop (in this case a mac) is shown below. 

**First block:** Compile the serial version

.. code-block:: bash
        
        MPI=N
        GROUP=N

**Second block:** use gcc and gfortran compilers

.. code-block:: bash

        #COMPILERS
        CC = gcc
        FC = gfortran
        FFF = gfortran

        #COMPILER FLAGS
        CFLAGS = -O3
        FFLAGS = -O3
        LFLAGS = -O3


**Third block:** Use the linking options under Fedora (Quantum/Luis local)

.. code-block:: bash

        $(FFF) $(LFLAGS) $(OBJ) -o $(BIN) $(PCM_LIBS) $(EFP_LIB) -llapack -lblas $(LIBS)

Use the :code:`make` command on the command line to compile FLOSIC. If the compilation was successful, an executable file titled **nrlmol_exe** will be created.

Additional Support
--------------------

Please visit our Github to access our Discussions_ forum and to report any issues with the software. 

.. _Discussions: https://github.com/FLOSIC/PublicRelease_2020/discussions

