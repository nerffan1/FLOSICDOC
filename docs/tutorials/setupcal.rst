.. _setup:

==================
Quick start 
==================


Basic input files for FLOSIC are called **CLUSTER** and **FRMORB**.  
The files require minimal input from the user and most parameters required for the calculations are set with 
default values. You can specify some parameters that control the calculations in the file called "NRLMOL_INPUT.DAT". 
A version of this file with default values is created in the run directory if it otherwise does not exist. We will 
discuss the details of the parameters in the **NRLMOL_INPUT.DAT** in a later section. 

For now let's work on setting up of the **CLUSTER** file. It is the minimal input needed to run the FLOSIC code.

An example CLUSTER file is shown below for the LiH molecule. The format is described in more detail in tutorial 1.

.. literalinclude:: /_static/input_files/CLUSTER


To run a FLOSIC calculation, a FRMORB file is required, which contains positions for FODs. An example FRMORB file is shown below for the LiH molecule defined in the CLUSTER file above.

.. literalinclude:: /_static/input_files/FRMORB

The first line states how many up spin FODs, and how many down spin FODs are used in the calculation. There are 2 up FODs, so the next 2 lines (lines 2-3)
contain x, y, & z coordinates for up spin FODs. There are also 2 down FODs, so the last 2 coordinates are for down spin FODs (lines 4-5).

To create starting FOD positions, you can simply place them by hand or use an FOD generator such as the fodMC code to create them.  
You can obtain a copy of the fodMC and documentation `here <https://github.com/pyflosic/fodMC>`_.

Before starting a FLOSIC calculation, make sure that the CALCTYPEV option in the NRLMOL_INPUT.DAT file is set to 'SCF-ONLY' instead of 'LBFGS'. 
This ensures that atomic geometries will not be updated after each self-consisten energy evaluation. This is recommended practice when FOD positions are being optimized.

Try running the code using the example CLUSTER and FRMORB files given above. The final energy (EDFT+SIC) in the SUMMARY file after a completed self-consistent calculation should be **-8.052832898** Hartree.

You'll notice the FOD positions in FRMORB have been moved, as they are being optimized, similar to an atomic geometry optimization at the DFT level. 
Previous FOD geometries are contained in the records file, along with FOD forces.




