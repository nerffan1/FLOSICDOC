#!/usr/bin/perl
#  This script will convert the xyz positions of atoms in the ".cube" file to atomic units.
#  This is required for thsese files to plot using GAUSSVIEW or JMOL.
#              Raja Tue Oct  5 09:44:23 MDT 2010





#if($#ARGV != 1){
#  printf stderr "Usage: $0 x y z <in.xyz >out.xyz\n";
#	exit 1;
#}

use strict;
my ($start,$zat, $i,@a, $f, @ff, $x, $y, $z, $aux,$natoms, $fin, $fout);

@ff = <STDIN>;

my $lines = scalar(@ff);

# Print first three lines.
for($i=0; $i<6; $i++){
   printf "%s", $ff[$i];
} #

  $_ = $ff[2];
  @a=split;
  $natoms = $_;
  #printf "Number of atoms %3d\n", $natoms;

     $f = 1.0;
     $f = 1.0/0.529177;

   for($i=0; $i<$natoms; $i++){
      $_ = $ff[$i+6]; @a=split;

      $zat = $a[0]; 
      $x = $a[2];
      $y = $a[3];
      $z = $a[4];
     
      $x = $x*$f;  
      $y = $y*$f;  
      $z = $z*$f;  
      printf "    %3d  %9.6f %13.6f %13.6f %13.6f\n", $zat,$zat, $x, $y, $z;
   } #


   $start = $natoms +6;
for($i=$start; $i<=$lines; $i++){
   printf "%s", $ff[$i];
} #

