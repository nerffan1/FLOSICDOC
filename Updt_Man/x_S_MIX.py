#!/usr/bin/python
# SCript to set up excited state calculation.

import sys,os,shutil,re,string


#***>>> Set up HOMO-LUMO MIXED SINGLET calculation **<<< 
#if len(sys.argv) != 5:  # the program name and the two arguments
#  # stop the program and print an error message
#  print len(sys.argv);
#  sys.exit("Usage: sys.argv[0]  particle_state particle_spin hole_state hole_spin")
#
#particle_state = int(sys.argv[1])
#particle_spin = int(sys.argv[2])
#hole_state = int(sys.argv[3])
#hole_spin = int(sys.argv[4])

# Convert the two arguments from strings into numbers

def get_GS_energy():
  file = open("GEOCNVRG","r");
  for line in file:
    if re.search("ENERGY",line):
      words = string.split(line)
      energy_gs = words[1]
      return energy_gs




def create_RUNTYPE():
  file = open("RUNTYPE","w");
  print >> file,'.TRUE.'

flist = ['RUNTYPE', 'SYMBOL', 'VMOLD', 'GRPMAT', 'ISYMGEN', 'HAMOLD', 'REPMAT'];


os.system("echo '.TRUE.' > RUNTYPE");
zdir = "d_EXC_HL_S_MIX"
os.mkdir(zdir)
## Check if excited state directory exist 
#atoz = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
#for i in atoz:
# zdir = "d_EXC"
# zdir = zdir+'_'+i
# if (os.path.exists(zdir)==0):
#   print zdir , 'does not exist';
#   print 'Creating directory',zdir
#   os.mkdir(zdir)
#   break
# else:
#   print zdir , 'does exist';






file = open("EVALUES","r");
# SUMMARY OF EVALUES AND THEIR OCCUPANCIES:
#    3  REP:  1  DEG:  1  SPIN:  1  ENERGY:   -24.3184      OCC:    1.00000    
ehomo=0;elumo=0; icount_occ_up = 0; icount_occ_dn=0;ideg=0;
aspin=[];
for line in file:
  if re.search("REP:",line) and re.search("OCC:",line):
      words = string.split(line)
      print 'words size',len(words)
      aspin.append(words[6]);
      occ = words[10];
      occ = occ.replace('-','E-');
      occ = occ.replace('EE-','E-');
      occ = float(occ);
      if float(occ > 0.9):
          ehomo = float(words[8])
          ideg = int(words[4]);
          if int(words[6]) == 1 :
            icount_occ_up = icount_occ_up + 1
            print line
          elif int(words[6]) == 2 :
            icount_occ_dn = icount_occ_dn + 1
      elif occ < 0.0001 or occ == 0.0 :
          elumo = words[8]
          print 'AA elumo =',elumo
          break

print 'Number of occupied spin up states',icount_occ_up
print 'Number of occupied spin dn states',icount_occ_dn
print 'ehomo =',ehomo
print 'elumo =',elumo

#  FOLLOWING IS TRIPLET HOMO-LUMO calculation
particle_state = icount_occ_up + 1
particle_spin =  1 
hole_state =  icount_occ_up
hole_spin = 2 


# Now copy files to directory "zdir";
for index in range(len(flist)):
   file = flist[index]
   dstname = os.path.join(zdir, file)
   print 'Copying file:', file
   shutil.copyfile(file,dstname)
energy_gs = get_GS_energy();
print 'Ground state energy = ',energy_gs
   

# Now write the file.
file = open("OCCEXC","w");
num_excited = '1     # Number of excited states to be calculated'
print >> file,num_excited
print >> file,energy_gs
print >> file,hole_spin, hole_state
print >> file,particle_spin, particle_state
print >> file,icount_occ_up,   ' # Number of GS occupied orbitals of spin 1'
occ_up_print = icount_occ_up + 1
occ_dn_print = icount_occ_dn + 1
out = " "
for i in range(1,occ_up_print):
  out = out + ' 1'

out = out + '       :GS occupancy of the states of spin 1'
print >> file, out
 
# Number of GS occupied orbitals of spin 2
print >> file,icount_occ_dn,   ' # Number of GS occupied orbitals of spin 2'

#GS occupancy of the states of spin 2
out = " "
for i in range(1,occ_dn_print):
  out = out + ' 1'

out = out + '       :GS occupancy of the states of spin 2'
print >> file, out

# NOW SET UP EXCITED STATE CALCULATIONS.


#Number of excited occupied orbitals of spin 1
# The follwing may have to be changed.

# SPIN 1 states for the excited states

if (particle_spin == 1):
   nstates = max (occ_up_print,(particle_state+1))
else:
   nstates = occ_up_print

print >> file,nstates-1,   ' # Number of occupied orbitals of spin 1 for the excited state'

out = ' ';
for i in range(1,nstates):
  if ( i == hole_state and hole_spin == 1 ):
     out = out + ' 0'
  elif (  particle_spin == 1 and i > icount_occ_up and i < particle_state ):
     out = out + ' 0'
  else:
     out = out + ' 1'

print >> file, out


# Now for the spin 2
if (particle_spin == 2):
   nstates = max (occ_dn_print,(particle_state+1))
   #print >> file, 'occ_dn_print,nstates',occ_dn_print,nstates
else:
   nstates = occ_dn_print

print >> file,nstates-1,   ' # Number of occupied orbitals of spin 2 for the excited state'

out = ' ';
for i in range(1,nstates):
  if ( i == hole_state and hole_spin == 2 ):
     out = out + ' 0'
  elif (  particle_spin == 2 and i > icount_occ_dn and i < particle_state ):
    #print >> file, 'i,nstates, 0',i,nstates
     out = out + ' 0'
  else:
    #print >> file, 'i,nstates, 1',i,nstates
     out = out + ' 1'

print >> file, out

file="OCCEXC"
dstname = os.path.join(zdir, file)
shutil.copyfile(file,dstname)




