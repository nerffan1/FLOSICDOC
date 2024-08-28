.. _nrlmolfiles:

#######################
Input and Output Files
#######################

As mentioned above, the minimal set of input files required for a FLOSIC calculation includes CLUSTER and FRMORB. 
Once the code is run, a number of additional files are generated. Some of these, like NRLMOL_INPUT.DAT (described earlier) can be edited to control how subsequent calculations run. The following is a list of important input/output files and a brief description of their contents:

.. note::
  
  Only the primary input and output files are explained here. For more information about additional files, please contact a FLOSIC team member or post on our GitHub Discussion section!


Input Files
===========


.. dropdown:: CLUSTER
    :animate: fade-in
    :class-title: CLUSTER
    :icon: file

    Main input file.

-----

.. dropdown:: SYMBOL
    :animate: fade-in
    :icon: file

    The exchange-correlation functional is specified on the first line. Atomic coordinates and bias potentials for each atom are stored for each
    iteration of an atomic geometry optimization. The last line allows the use of a more extensive default basis set (to use, set EXTRABASIS=1).
    SYMBOL includes essentially the same information as the CLUSTER file. If the SYMBOL file exists, CLUSTER is not read.

-----

.. dropdown:: FRMORB
    :animate: fade-in
    :icon: file

    Number of up spin FODs and down spin FODs, followed by the up spin FOD positions, then down spin FOD positions.

-----

.. dropdown:: RUNS
    :animate: fade-in
    :icon: file

    Control restart of calculation. Calculations can be restarted from Hamiltonian (**HAMOLD**), wavefunctions (**WFOUT**), or potential (**COUPOT**).


-----

.. dropdown:: ISYMGEN
    :animate: fade-in
    :icon: file
    :name: ISYMGEN

    Information about the basis set. (For an in depth description, see chapter 8.)

-----

Output Files
============

.. dropdown:: ATOMSPHNN
    :animate: fade-in
    :icon: file
    :class-title: ATOMSPHNN

    Charge and spin-based charge in each inequivalent atom integrated over a sphere of specified  radius.

-----

.. dropdown:: DIPOLE
    :animate: fade-in
    :icon: file
    :class-title: DIPOLE

    Contains x, y, z components of dipole moments in the atomic units.

-----

.. dropdown:: EVALUES
    :animate: fade-in
    :icon: file
    :class-title: EVALUES

    The canonical eigenvalues for the current step in an SCF calculation.
    If symmetry is used in the calculation, the eigenvalues are sorted by symmetry, and also by spin, if the calculation is spin-polarized.
    A list of eigenvalues and the occupation of the corresponding orbital is given at the end of the file.

-----

.. dropdown:: EVALNNN
    :animate: fade-in
    :icon: file
    :class-title: EVALNNN

    The eigenvalues, their spin, symmetry representation, degeneracy and occupancy,
    Fermi energy for each iteration number NNN.

-----

.. dropdown:: FRCOUT
    :animate: fade-in
    :icon: file
    :class-title: FRCOUT

    Total energy, forces on each atom, dipole moment, applied electric field.

-----

.. dropdown:: fande.out
    :animate: fade-in
    :icon: file
    :class-title: fande.out

    Iteration, total energy, square root of the sum of the squares of FOD forces, max FOD force.

-----

.. dropdown:: GEOCNVRG
    :animate: fade-in
    :icon: file
    :class-title: GEOCNVRG

    Convergence criteria, Total energy , largest atomic force, information about atomic geometry
    optimization.  Is written after every complete SCF cycle.

-----

.. dropdown:: HISTORY
    :animate: fade-in
    :icon: file
    :class-title: HISTORY

    Contains history of the geometry optimization. To see the energy as function of optimization step
    do 'grep -i TR HISTORY' in the directory.

-----

.. dropdown:: records
    :animate: fade-in
    :icon: file
    :class-title: records

    This file saves the FRMORB file at each iteration of FOD optimization,
    followed by the FOD forces on those FODs.

    .. literalinclude:: /Reference/files/records
        :caption: The following example shows (1) the SIC energy of the system, (2) a copy of the FRMORB file, and (3) the forces for each FOD.


-----

.. dropdown:: RHOTOT
    :animate: fade-in
    :icon: file
    :class-title: RHOTOT

    Total density on a specified grid. Is written in Gaussian cubic format.

-----

.. dropdown:: RHOSPN
    :animate: fade-in
    :icon: file
    :class-title: RHOSPN

    Spin density on a specified grid. Is written in Gaussian cubic format.

-----

.. dropdown:: SUMMARY
    :animate: fade-in
    :icon: file
    :class-title: SUMMARY

    Total energy, electronic charge, kinetic energy and trace of hamiltonian for each iteration.

-----

.. dropdown:: XMOL.DAT
    :animate: fade-in
    :icon: file
    :class-title: XMOL.DAT

    Geometry in the xyz format. The first column contains atomic numbers. The atomic coordinates are in Angstrom.

-----

.. dropdown:: XMOL.xyz
    :animate: fade-in
    :icon: file
    :class-title: XMOL.xyz

    Geometry in the xyz format. The first column contains atomic labels. The atomic coordinates are in Angstrom. Use **JMOL** to visualize this.
