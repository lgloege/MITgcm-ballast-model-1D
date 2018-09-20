#!/bin/sh
#======================================================================
# run script for mitgcmuv executable [setup for Habanero]
#
# Make sure to move mitgcmuv from build directory
#======================================================================
#SBATCH --account=ocp            # account name for the job.
#SBATCH --job-name=1D_ballast    # job name.
#SBATCH -c 1                     # number of cpu cores to use.
#SBATCH --time=1:30:00           # time the job will take to run
#SBATCH --mem-per-cpu=1gb        # memory job will use per cpu core.

### Modules needed to run model
module load intel-parallel-studio/2017
module load netcdf-fortran/4.4.4
module load netcdf/gcc/64/4.4.0

### Run the executable
date
./mitgcmuv
date
