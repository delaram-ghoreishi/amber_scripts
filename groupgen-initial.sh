#!/bin/bash

mkdir 1HEAT/
cd 1HEAT/

if [[ -e groupfile ]] ; then
  rm groupfile
fi
for ((i=0; i <= 15; i++)) ; do
 if [[ $i -lt 8 ]] ; then
   CRDFILE="../../0MIN/alpha-min.rst7"
 else
   CRDFILE="../../0MIN/beta-min.rst7"
 fi
 ext=`printf "%03i" $i`
 echo -O -p ../../0MIN/alpha.prmtop -c $CRDFILE -i ./1heat.in -x ./neb.x.$ext -o ./neb.out.$ext -inf ./neb.info.$ext -r ./neb.r.$ext >> groupfile
done

cat > 1heat.in <<EOF
Alanine NEB initial MD with small K
&cntrl
   imin = 0, irest = 0,
   ntc=2, ntf=2,
   ntpr=500, ntwx=500,
   ntb = 0, cut = 999.0, rgbmax=999.0,
   igb = 7, saltcon=0.2,
   nstlim = 40000, nscm=0,
   dt = 0.0005, ig=-1,
   ntt = 3, gamma_ln=1000.0,
   tempi=0.0, temp0=300.0,
   tgtfitmask=":1-12",
   tgtrmsmask=":1-12@N,CA,C",
   ineb = 1,skmin = 10,skmax = 10,
   nmropt=1,
/
&wt type='TEMP0', istep1=0,istep2=35000,
    value1=0.0, value2=300.0
/
&wt type='END'
/
EOF
cd ..
