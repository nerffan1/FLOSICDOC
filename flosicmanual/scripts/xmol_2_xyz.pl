#!/usr/bin/perl
# The script to symmetrize a molecule. It will use SYMMOL code to symmetrize the molecule.

use strict;
#use warnings;
use IO::File;
use File::Basename;
my ($x, $y, $z, $ax, @a, @b,$aux, $ff, $fn, $com);
my ($sym, $fout, $natoms,$title,$fin,$ftype,$i,%mol_data);

if($#ARGV != 1){
  printf STDERR "Usage: $0  in.xyz out.xyz \n";
	exit 1;
}

$fin = $ARGV[0];
$fout = $ARGV[1];
printf "The input and output file names are $fin AND $fout\n";

 (undef, undef, $ftype) = fileparse($fin,qr{\..*});
       if ($ftype =~ /DAT/i){$ftype = 'xmol'};
       if ($ftype =~ /XMOL/i){$ftype = 'xmol'};
       if ($ftype =~ /XYZ/i){$ftype = 'xyz'};
       if ($ftype =~ /xyz/i){$ftype = 'xyz'};

#$ftype = substr("${fin}",-3,3); # last three chars
 printf "FTYPE: $ftype\n";

 if ((lc($ftype) eq  'xmol')|| (lc($ftype) eq 'mol')) {
    printf "File type is XMOL\n";}
 elsif (lc($fin) eq  'XMOL.DAT') {
    printf "File type is XMOL\n";}
 elsif (lc($ftype) eq  'xyz') {
    printf "File type is xyz\n";}
 else {
    printf "Unknown file type\n"; 
  } # end_of_if


  open(OUT,">$fout");
  open(IN,"$fin");
     $_ = IN->getline();@a=split;
     $natoms = $a[0];
     $title = IN->getline();
     printf OUT "$natoms  \n   $title";
    
  for($i=1;$i<=$natoms;$i++){
     $_ = IN->getline();
     @a=split;
      if ((lc($ftype) eq  'xmol')|| (lc($ftype) eq 'mol')) {
       #$aux = &Elements::get_Z("$a[0]"); 
       $aux = &Zat_to_atsymbol($a[0]);
       $mol_data{"$i"}{'atom'} = $aux;}
    else {
       $mol_data{"$i"}{'atom'} = $a[0];
     } # end_of_if
     $mol_data{"$i"}{'x'} = $a[1];
     $mol_data{"$i"}{'y'} = $a[2];
     $mol_data{"$i"}{'z'} = $a[3];
     printf  OUT  ("%s   %13.6f %13.6f %13.6f\n",$aux,$a[1],$a[2],$a[3]);
  }




sub Zat_to_atsymbol(){
use strict;
my ($zat) = @_;  
my  @atsymbol = (' ', 'H','He','Li','Be','B','C','N','O','F','Ne','Na','Mg',   
       'Al','Si','P','S','Cl','Ar','K','Ca','Sc','Ti','V','Cr','Mn',  
       'Fe','Co','Ni','Cu','Zn','Ga','Ge','As','Se','Br','Kr','Rb','Sr',  
       'Y','Zr','Nb','Mo','Tc','Ru','Rh','Pd','Ag','Cd','In','Sn','Sb',  
       'Te','I','Xe','Cs','Ba','La','Ce','Pr','Nd','Pm','Sm','Eu','Gd',  
       'Tb','Dy','Ho','Er','Tm','Yb',  
       'Lu','Hf','Ta','W','Re','Os','Ir','Pt',  
       'Au','Hg','Tl','Pb','Bi','Po','At','Rn','Fr','Ra',  
       'Ac','Th','Pa','U','Np','Pu','Am','Cm','Bk','Cf','Es','Fm','Md',  
       'No','Lr','Rf','Db',  
       'Sg','Bh','Hs','Mt','Ds','Rg','Cn')  ;
        return $atsymbol[$zat];
} # end_of_sub atsymbol
  

#----------------------
sub atsymbol_to_Z(){
#use strict;
my ($label) = @_;  
my ($clabel,$i);
my  @atsymbol = (' ', 'H','He','Li','Be','B','C','N','O','F','Ne','Na','Mg',   
       'Al','Si','P','S','Cl','Ar','K','Ca','Sc','Ti','V','Cr','Mn',  
       'Fe','Co','Ni','Cu','Zn','Ga','Ge','As','Se','Br','Kr','Rb','Sr',  
       'Y','Zr','Nb','Mo','Tc','Ru','Rh','Pd','Ag','Cd','In','Sn','Sb',  
       'Te','I','Xe','Cs','Ba','La','Ce','Pr','Nd','Pm','Sm','Eu','Gd',  
       'Tb','Dy','Ho','Er','Tm','Yb',  
       'Lu','Hf','Ta','W','Re','Os','Ir','Pt',  
       'Au','Hg','Tl','Pb','Bi','Po','At','Rn','Fr','Ra',  
       'Ac','Th','Pa','U','Np','Pu','Am','Cm','Bk','Cf','Es','Fm','Md',  
       'No','Lr','Rf','Db',  
       'Sg','Bh','Hs','Mt','Ds','Rg','Cn')  ;

         for($i=0;$i<=112;$i++){
            $clabel = $atsymbol[$i];
            if ($clabel =~ /$label/i){ last;}
         }
            printf "$i $atsymbol[$i]\n ";
        return $i;
} # end_of_sub atsymbol
  
















exit;



# Now generate input for symmetrize program.

   open(O,">symmol.in") || die 'Cannot open file symmol.in to write!';
    printf O "# %s\n",chomp($title);
    # CELL PARAMETERS (free format) if orthogonal coordinates are given,  cell must be: 1 1 1 90 90 90 
    printf O "1.000    1.000    1.000   90.000   90.000   90.000\n 1 1   0.600   0.600\n";
  for($i=1;$i<=$natoms;$i++){
          $x = $mol_data{"$i"}{'x'};
          $y = $mol_data{"$i"}{'y'};
          $z = $mol_data{"$i"}{'z'};
          $sym = $mol_data{"$i"}{'atom'};
     printf O  ("%2s    %2d%9.5f%9.5f%9.5f\n",$sym,1,$x,$y,$z);
#         format(a6,i2,6f9.5)
      }
    
 

