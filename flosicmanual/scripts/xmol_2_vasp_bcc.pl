#!/usr/bin/perl -w 
  
#    This script is expected to generate the BCC solids using the clusters (XMOL.DAT) 
# as a building block. It will put the CLUSTER (or COM) at the origin and scale the
# xyz coordinates of cluster by the lattice constant (alat) to generate POSCAR file.
# It will also generate jmol for the conventional BCC cubic cell.
# The script can be used for other lattice with little modification.
#                             Rajendra Zope, El Paso, October 06, 2008.

use strict;
use IO::File;

my($x,$y,$z,$alat,$scale,@a);
my ($natoms, $i, %mol_data,%unit_cell_sites,$xt,$yt,$zt,$at,$j);


# =========================================
    open(IN,"final.xmol")|| die ("Cannot read final.xmol for reading!");
     $_ = IN->getline(); @a=split; 
   $natoms = $a[0];
   printf ("Number of atoms read:  %3d\n", $natoms);
     $_ = IN->getline(); 
   $i=0;
   while (<IN>){
    @a = split;
    $mol_data{"$i"}{'atom'} = $a[0];
    $mol_data{"$i"}{'x'} = $a[1];
    $mol_data{"$i"}{'y'} = $a[2];
    $mol_data{"$i"}{'z'} = $a[3];
    $i++;
   }
   if ($natoms != $i){printf ("Number of atoms %2d and no. of entries %2d do not agree!\n", $natoms, $i)};
     close(IN);

# =========================================
    $alat = 0;
   printf ("Give the lattice constant in Angstrom.\n");
      $alat = <STDIN>;
#  Generating POSCAR for bcc structure.
     open(O,">new.poscar");
     printf O (" Auto generated POSCAR for BCC from XMOL.DAT\n");
     printf O (" %10.4f    \n", $alat);
     printf O ("  %13.6f   %13.6f  %13.6f \n", -0.5,  0.5, 0.5);
     printf O ("  %13.6f   %13.6f  %13.6f \n",  0.5, -0.5, 0.5);
     printf O ("  %13.6f   %13.6f  %13.6f \n",  0.5,  0.5,-0.5);
     printf O (" %4d   # Change if there are two different types of atosm \n", $natoms);
     printf O (" Cartesian\n");
     for ($i=0;$i<$natoms; $i++){
         $at = $mol_data{"$i"}{'atom'} = $a[0];
         $x = $mol_data{"$i"}{'x'};
         $y = $mol_data{"$i"}{'y'};
         $z = $mol_data{"$i"}{'z'};
         if ($alat < 0.1){  die ("Wrong value of lattice constant: $alat\n")};
         $x = $x/$alat; $y = $y/$alat; $z = $z/$alat;
        printf O ("  %13.6f   %13.6f  %13.6f  # %2s\n",  $x, $y, $z,$at);
     } # end of for loop
         close(O);
         
    $unit_cell_sites{"1"}{'x'} = 0;
    $unit_cell_sites{"1"}{'y'} = 0;
    $unit_cell_sites{"1"}{'z'} = 0;

    $unit_cell_sites{"2"}{'x'} = $alat;
    $unit_cell_sites{"2"}{'y'} = 0;
    $unit_cell_sites{"2"}{'z'} = 0;

    $unit_cell_sites{"3"}{'x'} = 0;
    $unit_cell_sites{"3"}{'y'} = $alat;
    $unit_cell_sites{"3"}{'z'} = 0;

    $unit_cell_sites{"4"}{'x'} = 0;
    $unit_cell_sites{"4"}{'y'} = $alat;
    $unit_cell_sites{"4"}{'z'} = $alat;

    $unit_cell_sites{"5"}{'x'} = 0;
    $unit_cell_sites{"5"}{'y'} = 0;
    $unit_cell_sites{"5"}{'z'} = $alat;

    $unit_cell_sites{"6"}{'x'} = $alat;
    $unit_cell_sites{"6"}{'y'} = 0;
    $unit_cell_sites{"6"}{'z'} = $alat;

    $unit_cell_sites{"7"}{'x'} = $alat;
    $unit_cell_sites{"7"}{'y'} = $alat;
    $unit_cell_sites{"7"}{'z'} = 0;

    $unit_cell_sites{"8"}{'x'} = $alat;
    $unit_cell_sites{"8"}{'y'} = $alat;
    $unit_cell_sites{"8"}{'z'} = $alat;
#  Generating Conventional unit bcc unit cell.
       
     open(O,">new_unitcell.xyz");
     printf O ("  %6d    \n", $natoms*8);
     printf O (" Conventional BCC unit cell using XMOL.DAT as basis.\n");
     # Print positions at 
    for ($j=1;$j<=8;$j++){
       $xt = $unit_cell_sites{"$j"}{'x'};
       $yt = $unit_cell_sites{"$j"}{'y'};
       $zt = $unit_cell_sites{"$j"}{'z'};
       
         for ($i=0;$i<$natoms; $i++){
             $at = $mol_data{"$i"}{'atom'} = $a[0];
             $x = $mol_data{"$i"}{'x'};
             $y = $mol_data{"$i"}{'y'};
             $z = $mol_data{"$i"}{'z'};
             $x = $x + $xt; $y = $y + $yt; $z = $z + $zt;
            printf O ("%2s \t %13.6f   %13.6f  %13.6f  \n", $at, $x, $y, $z);
         } # end of for loop
     } # end of for loop
