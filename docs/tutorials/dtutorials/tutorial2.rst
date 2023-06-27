
########################################################################
Tutorial 2: a FLOSIC calculation for H2
########################################################################

In this tutorial we will learn to do a simple FLOSIC calculation with an H2 molecule.
As a reminder, the **CLUSTER** file is the main input file of FLOSIC. It contains 
the minimal information to set up the calculation. Below you will find the **CLUSTER** 
file for the hydrogen molecule.

************************************
Setting Up Input Structure
************************************

.. literalinclude:: input_data/CLUSTER.H2

As you saw from :ref:`Tutorial 1 <Tutorial 1: Molecular geometry optimization at the DFT level>`, the CLUSTER file will 
have the same Exchange Correlation functional :code:`GGA-PBE*GGA-PBE`, and point group symmetry :code:`NONE`. 

Since we are not making use of point group symmetry, the number of inequivalent atoms is the same as total number of atoms, 
which is 2 in this case. You can put the atoms anywhere; in this example, we have placed one Hydrogen atom at (0,0,Z) and 
the second one at (0,0,-Z). Atomic positions should be given in atomic units, Bohr. 
Following the xyz coordinates is the atomic number. The example listed is for hydrogen 
whose atomic number is 1. The string :code:`ALL` signifies that the calculations are to be performed
at the all-electron level. It is also possible to use pseudopotentials. Only the BHS pseudopotentials 
are hardwired into the code. It is also possible to use user-supplied (numerical) pseudopotentials also, but 
requires more work and is not recommended for beginners.

The last line has two fields: The first field for a 0.0 net charge (i.e. a neutral molecule) and the second is 0.0 for zero 
spin momentum

************************************
FLOSIC Calculation: The FRMORB File
************************************

A file called **FRMORB** is also required, which contains the FOD positions. An example FRMORB file for H2 is shown below:

.. literalinclude:: input_data/FRMORB.H2
    :caption: **FRMORB**

The first line contains two fields: 

- The first line is the number of spin up FODs (N=1)  
- The second is the number of spin down FODs (M=1)

For H2, we only have one electron in each spin channel. The up FOD coordinates (x,y,z) are the following N lines, and 
the down FODs are the subsequent M lines.

To avoid optimizing atomic geometries, change the :code:`CALCTYPE`` field in **NRLMOL_INPUT.DAT** from :code:`LBFGS` to :code:`SCF-ONLY`. 
This is recommended for FLOSIC calculations when the FODs are being optimized.

************************************
Running the FLOSIC Calculation
************************************

Now, copy the example **CLUSTER** and **FRMORB** into an empty directory, and run the calculation for the H2 molecule 
using the following command at the prompt.

.. code-block:: bash

    ${PATH_TO_FLOSIC}/nrlmol_exe &>> log &


Understanding the SUMMARY file
===================================

Browse through **SUMMARY** and look at the energies printed at each iteration of the SCF cycle. You should see that the minimum total energy is reached at self-consistency. The threshold for self-consistency is set in **NRLMOL_INPUT.DAT**, in the variable :code:`SCFTOLV`. The default value is 1.0D-6.

Once a self-consistent calculation finishes, the FOD forces are used in a gradient optimization scheme to update the FOD positions.
You can see this for yourself, in **SUMMARY**, that the :code:`TRACE` (i.e. the 1st column) is set to 0.0000, but the 
:code:`EDFT+SIC` energy changes per iteration.

.. literalinclude:: input_data/SampleSummary
    :caption: Sample SUMMARY
    :lines: 26-36


Other Important Output files to keep in mind 
=============================================

Look at the **EVALUES** file in which Kohn-Sham eigenvalues and occupation numbers are printed. 

The FOD forces, along their respective FOD positions, are displayed in the **records** file.

The **fande.out** file contains the (1) iterations, (2)total DFT+SIC energies, (3) square root of the sum of the squares of the FOD forces, 
and (4) the max FOD forces. When optimizing FODs, this is a good file to check for the convergence of FOD forces. 
There is also **fande.dat** which holds the last iteration of **fande.out**.

************************************
Further Iterations for Optimal FODs
************************************

Re-running the code will cause another self-consistent calculation to be performed using the updated FOD positions. A new total energy 
and new FOD forces will be calculated, and the FOD positions will again be updated. Repeating this process will result in the optimization 
of the FOD positions. Convergence can be gauged by the size by the largest FOD force.  When this drops below a chosen convergence 
criterion, the FODs are optimized.

.. note:: 

    Currently, the FOD convergence criterion is hard-coded and requires recompilation. 

To further optimize FODs, repeatedly run the code until the calculation is optimized to your criterion. 
A simple iterative loop can help with this process.

For the example of H2, there is only one FOD of each spin. Placing the FODs at any position in space
for such a case will give the same energy and the force on the FOD will therefore be zero.