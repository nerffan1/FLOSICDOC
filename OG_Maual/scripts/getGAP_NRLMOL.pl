#!/usr/bin/perl
# Directory containing information about input strs.
 
 
   #$count    = $ARGV[0];
   #${path}    = "/Users/rzope/fortran/Al";
   #${fvibinp} = "${path}/${count}/VIBINP";
 

   ${i} = 1;
   while( $i < 1000){
    $efile=${seval};
    if ( $i < 10) {$seval = "EVAL00${i}";}
    elsif (($i>9) && ($i < 100)) {$seval = "EVAL0${i}";}
    #printf("Current iter %2d FILE: %s \n", $i, $seval);
    if ( ! (-e ${seval})){last;}
    $i = $i +1; 
   }
     printf("Convereged eigenvalues are contained in file %s.\n", $efile);
  

   open(INP, $efile);
     
    #1  REP:  1  DEG:  1  SPIN:  1  ENERGY:   -76.3864      OCC:    1.00000 
     $j=1;
    while(<INP>){
     @a = split;
     if(($a[0] eq "FERMI") && ($a[1] eq "LEVEL:")){ ${efermi}=$a[2]; $etemp=$a[4]; }
     if(($a[1] eq "REP:") && ($a[7] eq "ENERGY:") && ($a[9] eq "OCC:")){
        $aocc[$j]=$a[10]; $aeval[$j]=$a[8];$j++;}
    } # end_of_while_loop

    close(INP);
    $i=1; $eaux =$aeval[1];
    if(abs($efermi)<= 0.000000) { die ("FErmi energy is not found.\n");}

   printf("efermi %13.6f a.u.\n", $efermi);
   #printf("OCC %13.6f\n", $aocc[1]);

    #while(abs($efermi) <= abs($eaux)){
    while( ($eaux - $efermi) <= 0.00001 ){
     #printf("iter %2d eaux %13.6f\n", $i, $eaux);
     #printf("Eig: %13.6f  OCC:  %13.6f \n", $aeval[$i], $aocc[$i]);
     ${i}=${i} + 1; $eaux = $aeval[$i];
    } # end_of_while_loop
     $elumo=$aeval[$i];
     $ehomo=$aeval[$i-1];
     ${egap}=(${elumo}-${ehomo})*27.2116; 
     printf("egap:%9.4f eV ehomo:%9.4f a.u.  elumo:%9.4f efermi:%9.4f\n",$egap, $ehomo,$elumo,$efermi);
     $f=27.2116;
     printf("egap:%9.4f eV ehomo:%9.2f eV    elumo:%9.4f efermi:%9.4f\n",$egap, $ehomo*$f,$elumo*$f,$efermi*$f);
     $aux = $aocc[${i}-1];
     if (($aux > 0.0) && (${aux}<1.0)){ printf("WARN: Metallic system\n");}
 
   
     
         
