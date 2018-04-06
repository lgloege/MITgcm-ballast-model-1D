#!/usr/bin/env bash
# --------------------------------------------------------------------------
# this script generates a makefile for 1D BATS model
# this will only work on Poseidon
# --------------------------------------------------------------------------
set -o errexit
set -o nounset
# set -o xtrace

# VARIABLE NAMES
MODS='/path_to_modifications_folder/maybe_it_is/1d_ballast_model'
OPTFILE='/path_to_your_optfile/look_in_tools_build_options'
ROOTDIR='/path_to_source_directory'
GENMAKE=' /path_to_genmake2_look_in_tools'
MAKEDEP='/usr/bin/makedepend'

# GENERATE MAKE FILE
${GENMAKE} --makedepend=${MAKEDEP} -mods=${MODS} -optfile=${OPTFILE} -rootdir=${ROOTDIR}
