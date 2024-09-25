Generating FODs: FODLego
###########################

`FODLego <https://github.com/nerffan1/FODLego>`_ is a deterministic method to generate FODs for a given molecular structure.
It uses monoatomic radii and a series of heuristics to predict FODs and it employs a class-based paradigm that allows the user to modify the construction parameters used to define FOD points around a molecule.
It only generates FODs up to :math:`\text{3sp}^3` orbitals.

Quick Start
************
For an .xyz file, you simply need to input the filename:

.. code-block:: bash

   ./fodlego input.xyz

SMILES structures also work. You just need to add quotation marks around it.

.. code-block:: bash

   ./fodlego  "NC(=S)NC"

For SMILES structures, you can check RDKit's `documentation <https://www.rdkit.org/docs/GettingStartedInPython.html#working-with-3d-molecules>`_ to read more about the rationale of 3D structure approximation.

Sample Performance on Small Organic Molecules
***********************************************

.. figure:: ./static/Iter_RMSD.svg

   The following image is taken from Angel Villegas' thesis *A Cheminformatics-Based Approach to the Prediction of Fermi-Orbital Descriptors (FODs) in Fermi-Lowdin Orbital Self Interaction Correction (FLOSIC) Theory*



Development Reference
***********************************************

Class Design
===============================================

.. figure:: ./static/classes_bfod.svg
