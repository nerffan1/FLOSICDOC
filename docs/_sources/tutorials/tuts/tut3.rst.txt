########################################################################
Tutorial 3:  FOD optimization of a water molecule 
########################################################################

This tutorial explains how to do a FODs optimization taking the example of the water molecule.

**************************************************
Setting Up Input Structure and Input Parameters
**************************************************

It is recommended to run a DFT calculation first to get the DFT optimized density. To do this, we start from the usual input:

.. literalinclude:: input_data/CLUSTER-H2O
    :caption: CLUSTER
 
In the **nrlmol_input.dat** file we change :code:`CALCTYPEV` from :code:`LBFGS` to :code:`SCF-ONLY` to switch off the molecular optimization. 
We also turn on the unrestricted calculation setting :code:`SPNPOLV = 'Y'`. Then we run :code:`NRLMOL` in a new directory with only **CLUSTER** and **nrlmol_input.dat** files:

.. code-block:: bash

    ${PATH_TO_FLOSIC}/nrlmol_exe > print.DFT

If the calculation finished correctly, all outputs should be generated, and we should have the following in the **RUNS** file

.. literalinclude:: input_data/RUNS-H2O

.. important::

    Check that you have :code:`4     4` in the second line. This tells FLOSIC to use the wave function stored in WFOUT to start the next calculation.
    The second number in the first line may be different if a molecular optimization was carried out.

**************************************************
Creating FODs for a FLOSIC Calculation
**************************************************

Now, we have to include the FOD positions. Here, we can use the `Monte Carlo FOD generator (fodMC) <https://pypi.org/project/fodMC/>`_. For that, we copy XMOL.xyz into a file named **system** and edit the second and last lines as shown:

.. literalinclude:: input_data/system-H2O

It might have an empty line at the end. The fodMC code and documentation can be found `here <https://github.com/pyflosic/fodMC>`_. When fodMC is executed 3 files are generated: **CLUSTER**, **FRMORB** and **Nuc_FOD.xyz**. Thus, it will overwrite our **CLUSTER** file if executed in the same directory. In our case, it does not matter because whenever the **SYMBOL** file is present **CLUSTER** is ignored. **FRMORB** contains the FODs in Bohrs for the unrestricted calculation (first the up, then the down). You should get something like this:

.. literalinclude:: input_data/FRMORB-H2O

If you do not have fodMC, you can copy-paste the previous **FRMORB**. It is important to always check how the FODs are distributed. For that, you can visualize **Nuc_FOD.xyz** with the software of your choice. The spin up FODs have the label X and the down FODs have the symbol He by default, so be careful if the He atom is included in your system. 

Running the FLOSIC code again in this directory will now cause a FLO-SIC-PBE calculation to be run.  (The existence of FRMORB is the flag for running a FLO-SIC calculation).

 $ **PATH_TO_FLOSIC/nrlmol_exe > print.001**

If everything goes well, we get now all the FLOSIC output files. Check the **SUMMARY** file. It should look like this (note that some columns of this file do not fit on the page):

.. literalinclude:: input_data/SUMMARY-H2O

The first block is for the normal DFT calculation with the 3rd and 6th column exactly the same (no SIC). The second block is for the FLOSIC run. In the standard output file -- renamed print.001 in this example (see the execution line above) -- search for the word ITERATION.

.. literalinclude:: input_data/print1-H2O

There it states that the wave function is read from WFOUT and gives the occupied and total number of orbitals. After giving the occupancies, it calculates the Lowdin overlap eigenvalues.

.. literalinclude:: input_data/print2-H2O

These values correspond to the eigenvalues of the overlap matrix formed from the Fermi orbitals.  This is diagonalized in the Lowdin process.  When one or more of these eigenvalues are smaller than 1E-08, it means that two or more of the Fermi orbitals are identical and the calculation stops with a message of bad FOD positions. At the end of the SCF cycle we get the following summary of energy contributions. Some of them are in the **SUMMARY** file too.

.. literalinclude:: input_data/print3-H2O

Once self-consistency is reached, the FOD forces are calculated and FOD positions are updated in **FRMIDT** (and/or in **FRMORB**) using the chosen optimization method. The default is scaled LBFGS, but it sometimes gets stuck or fails to obtain the next step. In those cases, we may switch off this variable in **NRLMOL_INPUT.DAT** SCALEDLBFGSV = 'N' to use the conjuged gradient for the FOD optimization. As the FODs are already updated and we also have the wave function and the **RUNS** file, we just run FLOSIC in the same directory to do the SCF cycle with the new FODs.

 $ **PATH_TO_FLOSIC/nrlmol_exe > print.002**

We can sucessively do this or use a script similar to that in the previous tutorial. After doing 5 steps of FOD optimization we can see in **fande.out** how the energy is decreasing and converging and the forces diminishing (not at every step).

.. literalinclude:: input_data/fande-H2O

All the used FODs, obtained forces, and corrected total energies can be seen in the **records** file.

