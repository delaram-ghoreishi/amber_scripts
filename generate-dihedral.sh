#!/bin/bash

for ((i=0; i<=19; i++));
do
  ext=$(printf "%03i" $i)
  cd $ext/5COOL2
  ../../ptraj.sh
  ../../dihedral.sh
  cd ../..
done
