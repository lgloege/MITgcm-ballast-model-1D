#!/usr/bin/env bash
# --------------------------------------------------------------------------
# this script build MITgcm for 1D BATS model
# this only works on habanero for now
# --------------------------------------------------------------------------
set -o errexit
set -o nounset
# set -o xtrace

###-------------------- habanero (Columbia Univ) --------------------------------------
module load intel-parallel-studio/2017
module load netcdf-fortran/4.4.4
module load netcdf/gcc/64/4.4.0

# set paths relative to $(pwd)/build
MODS='../modify/1d_ballast_model'
OPTFILE='../tools/build_options/linux_ia64_ifort_habanero'
ROOTDIR='../source'
GENMAKE='../tools/genmake2'

if [ ! -d build ] ; then mkdir build ; fi
cd build

# GENERATE MAKE FILE
${GENMAKE} -mods=${MODS} -optfile=${OPTFILE} -rootdir=${ROOTDIR}

make depend
make -j 4
