#!/bin/sh
#
#SBATCH --account=ocp            # The account name for the job.
#SBATCH --job-name=1d            # The job name.
##SBATCH -N 1                     # The number of nodes to use.
##SBATCH --exclusive
#SBATCH -c 1                     # The number of cpu cores to use.
#SBATCH --time=4:59:00           # The time the job will take to run 
#SBATCH --mem-per-cpu=1gb        # The memory the job will use per cpu core.
 
module load intel-parallel-studio/2017
module load netcdf-fortran/4.4.4
module load netcdf/gcc/64/4.4.0
 
date
./mitgcmuv 
date
 
