Generating FODs: FODLego
########################

`FODLego <https://github.com/nerffan1/FODLego>`_ is a deterministic method to generate FODs for a given molecular structure.
It uses monoatomic radii and a series of heuristics to predict FODs and it employs a class-based paradigm that allows the user to modify the construction parameters used to define FOD points around a molecule.
It only generates FODs up to :math:`\text{3sp}^3` orbitals.

Installation and Running
************************
FODLego is available to download via `pip <https://pypi.org/project/FODLego/>`_ :

.. code-block:: bash

    pip install FODLego

FODLego should now be available as command on your shell. If you execute `fodlego` with no input, you should get the following error:

.. code-block:: bash

    WARNING:__main__.py:main(): No arguments were given, please provide XYZ file name


For CLUSTER files, you simply call:


.. code-block:: bash

   fodlego CLUSTER

For an .xyz file, you simply need to input the filename:

.. code-block:: bash

   fodlego input.xyz

SMILES structures also work. You just need to add quotation marks around it.

.. code-block:: bash

   fodlego  "NC(=S)NC"

For SMILES structures, you can check RDKit's `documentation <https://www.rdkit.org/docs/GettingStartedInPython.html#working-with-3d-molecules>`_ to read more about the rationale of 3D structure approximation.

Sample Performance on Small Organic Molecules
***********************************************

.. figure:: ./static/Iter_RMSD.svg

   The following image is taken from Angel Villegas' thesis *A Cheminformatics-Based Approach to the Prediction of Fermi-Orbital Descriptors (FODs) in Fermi-Lowdin Orbital Self Interaction Correction (FLOSIC) Theory*



Development Reference
***********************************************

Github
========
Please visit the `Github <https://github.com/nerffan1/FODLego>`_ page in order to suggest features, improvements, or ask questions!

Class Design
===============================================

.. figure:: ./static/classes_bfod.svg
