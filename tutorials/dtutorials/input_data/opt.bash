#!/bin/bash
  export niters=41

  export iter=1
 while [ $iter -le $niters ]; do

    #${mpirun}  -np ${NP}   ./bcluster > print.${iter}
    #${mpirun} -machinefile $PBS_NODEFILE -np ${NP} ./cluster  > print.${iter}
    ./cluster  > print.${iter}

    cat FRCOUT >> FRCOUT-TOT
    cp FRCOUT FRCOUT.${iter}
      if [ -e "EXIT" ]; then
            rm -f EXIT; exit
      fi
      if [ -e "GEOCNVRG" ]; then
        export x=`cat GEOCNVRG| grep CONV |awk '{print $2}'`
          if [ $x == 'TRUE' ]; then
             echo "Looks like geometry is converged at step ${iter}. \n Stopping..."
             exit
          fi
      fi
   let  iter=${iter}+1
 done # end_of_while_loop

