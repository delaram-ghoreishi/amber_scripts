#!/bin/bash
# help:
# get the prmtop topology as the first argument

rm dihedral.in

#top='../../str1.prmtop'
top=${1}

echo "trajin iresp00.restarts.nc" >> dihedral.in
echo "multidihedral phi psi resrange 1-3 out dihedral.out" >> dihedral.in
echo "run" >> dihedral.in
echo "quit" >> dihedral.in

$AMBERHOME/bin/cpptraj $top dihedral.in
