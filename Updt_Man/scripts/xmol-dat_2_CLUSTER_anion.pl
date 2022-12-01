#!/usr/bin/perl -w
# Script to generate NRLMOL CLUSTER file from XMOL.DAT.
# The center of mass is not translated to origin.
#        Raja, El Paso, Texas,  Sept. 28, 2007.

use strict;
use IO::File;

my (@a, @flist, $flist, $fin, $Zat, $fnrlmol, $fstr);
my ($source_dir, $e_vasp, $line, $ss, $sss, $date, $natoms, $i, $faa, $charge, $moment, $aux); 
my ($x,$y,$z,$j);


$faa = 1.0/0.529177;
$charge = -1;
$moment = 0;
$date = `date`; 
$sss = "\tInput file generated by Perl script from KSSP basin hopping vasp optimized data. \n \t\t\t Raja, El Paso, Texas $date";
$fin = "XMOL.DAT";
$ss ="GGA-PBE*GGA-PBE\n GRP \n";









#---------------Main body
    $fnrlmol = "CLUSTER";
    open(O,">$fnrlmol")||die("Cannot open \"$fnrlmol\" file for generating NRLMOL inut file. $!");
     printf O ("%s", $ss);


    open(IN,"XMOL.DAT")||die("Cannot open \"XMOL.DAT\" file for reading. $!");
     $_ = IN -> getline(); @a=split; $natoms= $a[0];
     printf O (" %2d  Number of inequivalent atoms\n", $natoms);

     $_ = IN -> getline(); @a=split; $e_vasp = $a[1];

     $aux =  2*int($natoms/2) - $natoms;     

      if ($aux < 0 ) { 
         $moment = 0; 
      } else {
        ${moment} = 3;
      } # end_of_if
       
     printf  ("Natoms  %2d  Moment:  %2d   E_Vasp: %13.6f\n", $natoms, $moment, $e_vasp);


       for ($i=1; $i<= $natoms; $i++){
         $_ = IN -> getline(); @a=split;
         $x = $a[1]; $y=$a[2]; $z=$a[3]; $Zat=$a[0];
         # Convert to atomic unit
         $x = $x*$faa; $y=$y*$faa; $z=$z*$faa;
         printf O ("%15.8f  %15.8f  %15.8f  %s  ALL\n", $x, $y,$z,$Zat);
       }
     close(IN);
      printf  O ( "  %2d    %2d     Charge and Moment\n\n\n %s \n", $charge, $moment, $sss);

#---------------Main body


