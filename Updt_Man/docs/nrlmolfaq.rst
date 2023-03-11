.. _nrlmolfaq:

Getting more information about FLOSIC
=====================================


 Questions about the FLOSIC code or its use can be directed to
 	- Tunna Baruah        (UTEP), tbaruah@utep.edu
 	- Rajendra R. Zope    (UTEP), rzope@utep.edu
 	- Koblar Alan Jackson (CMU), jacks1ka@cmich.edu
 
 or write to the FLOSIC mail server electronic_structure_lab@listserv.utep.edu.
 
 
 Some FAQs are listed below.

  #. What convergence criteria should be considered for the FOD optimization?
	In general, you want to make sure that your total energy is converged within your given SCF tolerance (like in a standard DFT calculation) and
	that the largest FOD force is at least smaller than 5E-4 Ha/Bohr.

  #. How can I start a spin-polarized/ spin-unrestricted calculation? 
	For a spin-unrestricted calculation, you need to make sure that your underlying DFT density is spin-unrestricted as well. 
	If your system has a permanent spin polarization (i.e. the number of up and down electrons is different), the calculation
	will always be spin-unrestricted.
	In the case of a total spin of S = 0 (i.e. same number of up and down electrons), the code automatically carries out
	a spin-restricted calculation. To switch to a spin-unrestricted setup (i.e. having individual sets of up and down FODs in the FRMORB file), set the
        SPNPOLV option in NRLMOL_INPUT.DAT to Y. 

  #. Is it possible to force antiferromagntic spin ordering in some atoms?
	Yes, you can specify atoms to have a preference for spin-up density, spin-down density or unpolarized density. The specifications needs to be made in the SYMBOL file. Here is an example :

	| ALL-MAN001 =        2.137000       -0.350000        0.003300 SUP
	| ALL-MAN001 =        3.456900       -2.109300        0.093100 SDN
	| ALL-CAR001 =        2.720100       -2.490500        0.106000 UPO
	
	SUP, SDN and UPO signify spin up, spin down and unpolarized atoms. The default choice is UPO.
	Note that these are starting values for the atoms. After SCF, the density can be different than what has been initialized.
