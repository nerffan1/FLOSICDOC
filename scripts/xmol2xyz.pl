#!/usr/bin/perl
use strict;
use IO::File;

my($zat,$symbol,$ff,$aux,$x,$y,$z);
my($natoms,$i,$Zat,$e_vasp,@a,$moment,$charge);

# It requires two inputs
if($#ARGV != 1){
  printf stderr "Usage: $0 file.xyz file.xmol  \n";
  printf stderr "             OR  \n ";
  printf stderr "Usage: $0 file.xmol file.xyz \n ";
  printf stderr ("%s \n", $#ARGV);
        exit 1;
}

use warnings;

my $fin=$ARGV[0];
my $fout=$ARGV[1];



    open(IN,"${fin}")||die("Cannot open \"${fin}\" file for reading. $!");
    open(O,">${fout}")||die("Cannot open \"${fout}\" file for writing. $!");
    $_ = IN -> getline(); @a=split; $natoms= $a[0];
    printf O (" %2d  Number of inequivalent atoms\n", $natoms);

     $_ = IN -> getline(); @a=split; $e_vasp = $a[1];

     $aux =  2*int($natoms/2) - $natoms;     

      if ($aux < 0 ) { 
         $moment = 3; 
      } else {
        ${moment} = 0;
      } # end_of_if
       
     printf O ("Natoms  %2d  Moment:  %2d   E_Vasp: %13.6f\n", $natoms, $moment, $e_vasp);


       for ($i=1; $i<= $natoms; $i++){
         $_ = IN -> getline(); @a=split;
         $x = $a[1]; $y=$a[2]; $z=$a[3]; $symbol =$a[0];
         # get atomic number

        #$Zat = $a[0];
        $Zat = &Aget_atomic_label($symbol);
         # Convert to atomic unit
#         $x = $x*$faa; $y=$y*$faa; $z=$z*$faa;
             
         printf O ("%2s  %15.8f  %15.8f %15.8f \n", $Zat, $x, $y,$z);
         #printf O ("%15.8f  %15.8f  %15.8f  %s  ALL\n", $x, $y,$z,$Zat);
       }
     close(IN);
#      printf  O ( "  %2d    %2d     Charge and Moment\n\n\n %s \n", $charge, $moment, $sss);

#---------------Main body






##====================================================================


sub get_atomic_label(){
#  local ($symbol);
  (${symbol}) = @_;
         $symbol =~ tr/A-Z/a-z/ ;  # translate to lowercase
         $symbol = ucfirst($symbol); 

        if (${symbol} eq "1" ) {
            $zat = "H" ;
            return (${zat});
         }
        if (${symbol} eq "He" ) {
            $zat = "2" ;
            return (${zat});
         }
        if (${symbol} eq "Li" ) {
            $zat = "3" ;
            return (${zat});
         }
        if (${symbol} eq "Be" ) {
            $zat = "4" ;
            return (${zat});
         }
        if (${symbol} eq "B" ) {
            $zat = "5" ;
            return (${zat});
         }
        if (${symbol} eq "C" ) {
            $zat = "6" ;
            return (${zat});
         }
        if (${symbol} eq "N" ) {
            $zat = "7" ;
            return (${zat});
         }
        if (${symbol} eq "O" ) {
            $zat = "8" ;
            return (${zat});
         }
        if (${symbol} eq "F" ) {
            $zat = "9" ;
            return (${zat});
         }
        if (${symbol} eq "Ne" ) {
            $zat = "10" ;
            return (${zat});
         }
        if (${symbol} eq "Na" ) {
            $zat = "11" ;
            return (${zat});
         }
        if (${symbol} eq "Mg" ) {
            $zat = "12" ;
            return (${zat});
         }
        if (${symbol} eq "Al" ) {
            $zat = "13" ;
            return (${zat});
         }
        if (${symbol} eq "Si" ) {
            $zat = "14" ;
            return (${zat});
         }
        if (${symbol} eq "P" ) {
            $zat = "15" ;
            return (${zat});
         }
        if (${symbol} eq "S" ) {
            $zat = "16" ;
            return (${zat});
         }
        if (${symbol} eq "Cl" ) {
            $zat = "17" ;
            return (${zat});
         }
        if (${symbol} eq "Ar" ) {
            $zat = "18" ;
            return (${zat});
         }
        if (${symbol} eq "K" ) {
            $zat = "19" ;
            return (${zat});
         }
        if (${symbol} eq "Ca" ) {
            $zat = "20" ;
            return (${zat});
         }
        if (${symbol} eq "Sc" ) {
            $zat = "21" ;
            return (${zat});
         }
        if (${symbol} eq "Ti" ) {
            $zat = "22" ;
            return (${zat});
         }
        if (${symbol} eq "V" ) {
            $zat = "23" ;
            return (${zat});
         }
        if (${symbol} eq "Cr" ) {
            $zat = "24" ;
            return (${zat});
         }
        if (${symbol} eq "Mn" ) {
            $zat = "25" ;
            return (${zat});
         }
        if (${symbol} eq "Fe" ) {
            $zat = "26" ;
            return (${zat});
         }
        if (${symbol} eq "Co" ) {
            $zat = "27" ;
            return (${zat});
         }
        if (${symbol} eq "Ni" ) {
            $zat = "28" ;
            return (${zat});
         }
        if (${symbol} eq "Cu" ) {
            $zat = "29" ;
            return (${zat});
         }
        if (${symbol} eq "Zn" ) {
            $zat = "30" ;
            return (${zat});
         }
        if (${symbol} eq "Ga" ) {
            $zat = "31" ;
            return (${zat});
         }
        if (${symbol} eq "Ge" ) {
            $zat = "32" ;
            return (${zat});
         }
        if (${symbol} eq "As" ) {
            $zat = "33" ;
            return (${zat});
         }
        if (${symbol} eq "Se" ) {
            $zat = "34" ;
            return (${zat});
         }
        if (${symbol} eq "Br" ) {
            $zat = "35" ;
            return (${zat});
         }
        if (${symbol} eq "Kr" ) {
            $zat = "36" ;
            return (${zat});
         }
        if (${symbol} eq "Rb" ) {
            $zat = "37" ;
            return (${zat});
         }
        if (${symbol} eq "Sr" ) {
            $zat = "38" ;
            return (${zat});
         }
        if (${symbol} eq "Y" ) {
            $zat = "39" ;
            return (${zat});
         }
        if (${symbol} eq "Zr" ) {
            $zat = "40" ;
            return (${zat});
         }
        if (${symbol} eq "Nb" ) {
            $zat = "41" ;
            return (${zat});
         }
        if (${symbol} eq "Mo" ) {
            $zat = "42" ;
            return (${zat});
         }
        if (${symbol} eq "Tc" ) {
            $zat = "43" ;
            return (${zat});
         }
        if (${symbol} eq "Ru" ) {
            $zat = "44" ;
            return (${zat});
         }
        if (${symbol} eq "Rh" ) {
            $zat = "45" ;
            return (${zat});
         }
        if (${symbol} eq "Pd" ) {
            $zat = "46" ;
            return (${zat});
         }
        if (${symbol} eq "Ag" ) {
            $zat = "47" ;
            return (${zat});
         }
        if (${symbol} eq "Cd" ) {
            $zat = "48" ;
            return (${zat});
         }
        if (${symbol} eq "In" ) {
            $zat = "49" ;
            return (${zat});
         }
        if (${symbol} eq "Sn" ) {
            $zat = "50" ;
            return (${zat});
         }
        if (${symbol} eq "Sb" ) {
            $zat = "51" ;
            return (${zat});
         }
        if (${symbol} eq "Te" ) {
            $zat = "52" ;
            return (${zat});
         }
        if (${symbol} eq "I" ) {
            $zat = "53" ;
            return (${zat});
         }
        if (${symbol} eq "Xe" ) {
            $zat = "54" ;
            return (${zat});
         }
        if (${symbol} eq "Cs" ) {
            $zat = "55" ;
            return (${zat});
         }
        if (${symbol} eq "Ba" ) {
            $zat = "56" ;
            return (${zat});
         }
        if (${symbol} eq "La" ) {
            $zat = "57" ;
            return (${zat});
         }
        if (${symbol} eq "Ce" ) {
            $zat = "58" ;
            return (${zat});
         }
        if (${symbol} eq "Pr" ) {
            $zat = "59" ;
            return (${zat});
         }
        if (${symbol} eq "Nd" ) {
            $zat = "60" ;
            return (${zat});
         }
        if (${symbol} eq "Pm" ) {
            $zat = "61" ;
            return (${zat});
         }
        if (${symbol} eq "Sm" ) {
            $zat = "62" ;
            return (${zat});
         }
        if (${symbol} eq "Eu" ) {
            $zat = "63" ;
            return (${zat});
         }
        if (${symbol} eq "Gd" ) {
            $zat = "64" ;
            return (${zat});
         }
        if (${symbol} eq "Tb" ) {
            $zat = "65" ;
            return (${zat});
         }
        if (${symbol} eq "Dy" ) {
            $zat = "66" ;
            return (${zat});
         }
        if (${symbol} eq "Ho" ) {
            $zat = "67" ;
            return (${zat});
         }
        if (${symbol} eq "Er" ) {
            $zat = "68" ;
            return (${zat});
         }
        if (${symbol} eq "Tm" ) {
            $zat = "69" ;
            return (${zat});
         }
        if (${symbol} eq "Yb" ) {
            $zat = "70" ;
            return (${zat});
         }
        if (${symbol} eq "Lu" ) {
            $zat = "71" ;
            return (${zat});
         }
        if (${symbol} eq "Hf" ) {
            $zat = "72" ;
            return (${zat});
         }
        if (${symbol} eq "Ta" ) {
            $zat = "73" ;
            return (${zat});
         }
        if (${symbol} eq "W" ) {
            $zat = "74" ;
            return (${zat});
         }
        if (${symbol} eq "Re" ) {
            $zat = "75" ;
            return (${zat});
         }
        if (${symbol} eq "Os" ) {
            $zat = "76" ;
            return (${zat});
         }
        if (${symbol} eq "Ir" ) {
            $zat = "77" ;
            return (${zat});
         }
        if (${symbol} eq "Pt" ) {
            $zat = "78" ;
            return (${zat});
         }
        if (${symbol} eq "Au" ) {
            $zat = "79" ;
            return (${zat});
         }
        if (${symbol} eq "Hg" ) {
            $zat = "80" ;
            return (${zat});
         }
        if (${symbol} eq "Tl" ) {
            $zat = "81" ;
            return (${zat});
         }
        if (${symbol} eq "Pb" ) {
            $zat = "82" ;
            return (${zat});
         }
        if (${symbol} eq "Bi" ) {
            $zat = "83" ;
            return (${zat});
         }
        if (${symbol} eq "Po" ) {
            $zat = "84" ;
            return (${zat});
         }
        if (${symbol} eq "At" ) {
            $zat = "85" ;
            return (${zat});
         }
        if (${symbol} eq "Rn" ) {
            $zat = "86" ;
            return (${zat});
         }
        if (${symbol} eq "Fr" ) {
            $zat = "87" ;
            return (${zat});
         }
        if (${symbol} eq "Ra" ) {
            $zat = "88" ;
            return (${zat});
         }
        if (${symbol} eq "Ac" ) {
            $zat = "89" ;
            return (${zat});
         }
        if (${symbol} eq "Th" ) {
            $zat = "90" ;
            return (${zat});
         }
        if (${symbol} eq "Pa" ) {
            $zat = "91" ;
            return (${zat});
         }
        if (${symbol} eq "U" ) {
            $zat = "92" ;
            return (${zat});
         }
        if (${symbol} eq "Np" ) {
            $zat = "93" ;
            return (${zat});
         }
        if (${symbol} eq "Pu" ) {
            $zat = "94" ;
            return (${zat});
         }
        if (${symbol} eq "Am" ) {
            $zat = "95" ;
            return (${zat});
         }
        if (${symbol} eq "Cm" ) {
            $zat = "96" ;
            return (${zat});
         }
        if (${symbol} eq "Bk" ) {
            $zat = "97" ;
            return (${zat});
         }
        if (${symbol} eq "Cf" ) {
            $zat = "98" ;
            return (${zat});
         }
        if (${symbol} eq "Es" ) {
            $zat = "99" ;
            return (${zat});
         }
        if (${symbol} eq "Fm" ) {
            $zat = "100" ;
            return (${zat});
         }
        if (${symbol} eq "Md" ) {
            $zat = "101" ;
            return (${zat});
         }
        if (${symbol} eq "No" ) {
            $zat = "102" ;
            return (${zat});
         }
        if (${symbol} eq "Lr" ) {
            $zat = "103" ;
            return (${zat});
         }
        if (${symbol} eq "Rf" ) {
            $zat = "104" ;
            return (${zat});
         }
        if (${symbol} eq "Db" ) {
            $zat = "105" ;
            return (${zat});
         }
        if (${symbol} eq "Sg" ) {
            $zat = "106" ;
            return (${zat});
         }
        if (${symbol} eq "Bh" ) {
            $zat = "107" ;
            return (${zat});
         }
        if (${symbol} eq "Hs" ) {
            $zat = "108" ;
            return (${zat});
         }
        if (${symbol} eq "Mt" ) {
            $zat = "109" ;
            return (${zat});
         }
        if (${symbol} eq "Ds" ) {
            $zat = "110" ;
            return (${zat});
         }
        if (${symbol} eq "Rg" ) {
            $zat = "111" ;
            return (${zat});
         }
        if (${symbol} eq "Cn" ) {
            $zat = "112" ;
            return (${zat});
         }
        if (${symbol} eq "Uut" ) {
            $zat = "113" ;
            return (${zat});
         }
        if (${symbol} eq "Uuq" ) {
            $zat = "114" ;
            return (${zat});
         }
        if (${symbol} eq "Uup" ) {
            $zat = "115" ;
            return (${zat});
         }
        if (${symbol} eq "Uuh" ) {
            $zat = "116" ;
            return (${zat});
         }
} # end_of_sub

sub Aget_atomic_label(){
  (${symbol}) = @_;
my %elements;
         $symbol =~ tr/A-Z/a-z/ ;  # translate to lowercase
         $symbol = ucfirst($symbol); 
%elements = (
'H'  => '1',      '1' => 'H',
'He' => '2',      '2' => 'He',
'Li' => '3',      '3' => 'Li',
'Be' => '4',      '4' => 'Be',
'B'  => '5',      '5' => 'B',
'C'  => '6',      '6' => 'C',
'N'  => '7',      '7' => 'N',
'O'  => '8',      '8' => 'O',
'F'  => '9',      '9' => 'F',
'Ne' => '10',    '10' => 'Ne',
'Na' => '11',    '11' => 'Na',
'Mg' => '12',    '12' => 'Mg',
'Al' => '13',    '13' => 'Al',
'Si' => '14',    '14' => 'Si',
'P'  => '15',    '15' => 'P',
'S'  => '16',    '16' => 'S',
'Cl' => '17',    '17' => 'Cl',
'Ar' => '18',    '18' => 'Ar',
'K'  => '19',    '19' => 'K',
'Ca' => '20',    '20' => 'Ca',
'Sc' => '21',    '21' => 'Sc',
'Ti' => '22',    '22' => 'Ti',
'V'  => '23',    '23' => 'V',
'Cr' => '24',    '24' => 'Cr',
'Mn' => '25',    '25' => 'Mn',
'Fe' => '26',    '26' => 'Fe',
'Co' => '27',    '27' => 'Co',
'Ni' => '28',    '28' => 'Ni',
'Cu' => '29',    '29' => 'Cu',
'Zn' => '30',    '30' => 'Zn',
'Ga' => '31',    '31' => 'Ga',
'Ge' => '32',    '32' => 'Ge',
'As' => '33',    '33' => 'As',
'Se' => '34',    '34' => 'Se',
'Br' => '35',    '35' => 'Br',
'Kr' => '36',    '36' => 'Kr',
'Rb' => '37',    '37' => 'Rb',
'Sr' => '38',    '38' => 'Sr',
'Y'  => '39',    '39' => 'Y',
'Zr' => '40',    '40' => 'Zr',
'Nb' => '41',    '41' => 'Nb',
'Mo' => '42',    '42' => 'Mo',
'Tc' => '43',    '43' => 'Tc',
'Ru' => '44',    '44' => 'Ru',
'Rh' => '45',    '45' => 'Rh',
'Pd' => '46',    '46' => 'Pd',
'Ag' => '47',    '47' => 'Ag',
'Cd' => '48',    '48' => 'Cd',
'In' => '49',    '49' => 'In',
'Sn' => '50',    '50' => 'Sn',
'Sb' => '51',    '51' => 'Sb',
'Te' => '52',    '52' => 'Te',
'I'  => '53',    '53' => 'I',
'Xe' => '54',    '54' => 'Xe',
'Cs' => '55',    '55' => 'Cs',
'Ba' => '56',    '56' => 'Ba',
'La' => '57',    '57' => 'La',
'Ce' => '58',    '58' => 'Ce',
'Pr' => '59',    '59' => 'Pr',
'Nd' => '60',    '60' => 'Nd',
'Pm' => '61',    '61' => 'Pm',
'Sm' => '62',    '62' => 'Sm',
'Eu' => '63',    '63' => 'Eu',
'Gd' => '64',    '64' => 'Gd',
'Tb' => '65',    '65' => 'Tb',
'Dy' => '66',    '66' => 'Dy',
'Ho' => '67',    '67' => 'Ho',
'Er' => '68',    '68' => 'Er',
'Tm' => '69',    '69' => 'Tm',
'Yb' => '70',    '70' => 'Yb',
'Lu' => '71',    '71' => 'Lu',
'Hf' => '72',    '72' => 'Hf',
'Ta' => '73',    '73' => 'Ta',
'W'  => '74',    '74' => 'W',
'Re' => '75',    '75' => 'Re',
'Os' => '76',    '76' => 'Os',
'Ir' => '77',    '77' => 'Ir',
'Pt' => '78',    '78' => 'Pt',
'Au' => '79',    '79' => 'Au',
'Hg' => '80',    '80' => 'Hg',
'Tl' => '81',    '81' => 'Tl',
'Pb' => '82',    '82' => 'Pb',
'Bi' => '83',    '83' => 'Bi',
'Po' => '84',    '84' => 'Po',
'At' => '85',    '85' => 'At',
'Rn' => '86',    '86' => 'Rn',
'Fr' => '87',    '87' => 'Fr',
'Ra' => '88',    '88' => 'Ra',
'Ac' => '89',    '89' => 'Ac',
'Th' => '90',    '90' => 'Th',
'Pa' => '91',    '91' => 'Pa',
'U'  => '92',    '92' => 'U',
'Np' => '93',    '93' => 'Np',
'Pu' => '94',    '94' => 'Pu',
'Am' => '95',    '95' => 'Am',
'Cm' => '96',    '96' => 'Cm',
'Bk' => '97',    '97' => 'Bk',
'Cf' => '98',    '98' => 'Cf',
'Es' => '99',    '99' => 'Es',
'Fm' => '100',  '100' => 'Fm',
'Md' => '101',  '101' => 'Md',
'No' => '102',  '102' => 'No',
'Lr' => '103',  '103' => 'Lr',
'Rf' => '104',  '104' => 'Rf',
'Ha' => '105',  '105' => 'Ha',
'Sg' => '106',  '106' => 'Sg',
'Bh' => '107',  '107' => 'Bh',
'Hs' => '108',  '108' => 'Hs',
'Mt' => '109',  '109' => 'Mt'
);
         $aux = $elements{$symbol};
 return("$aux");
 $aux=$symbol;
}
