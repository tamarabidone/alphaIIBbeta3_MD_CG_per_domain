#!/bin/bash
#SBATCH --time=8:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=8
#SBATCH --cpus-per-task=8
#SBATCH --gres=gpu:1
#SBATCH --mem=0
#SBATCH --job-name=B-1
#SBATCH --out=consoleoutput.out
#SBATCH --error=error.err
#SBATCH --mail-type=all
#SBATCH --mail-user=onkar.joshi@sci.utah.edu
#SBATCH --account=owner-gpu-guest
#SBATCH --partition=notchpeak-gpu-guest
#SBATCH --exclusive
#SBATCH --array=1-80%1

# fill in the job-name and mail-user (email address) above
# fill in the -deffnm for the default file name you are using as your input and will also be used for output.

# Use gromacs
module --force purge
module load gcc/11.2.0 openmpi/4.1.4 gromacs/2022.3

# Threads per MPI Process
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

mpirun -np $SLURM_NTASKS gmx_mpi mdrun -ntomp $OMP_NUM_THREADS -deffnm step5.0 -cpi step5.0.cpt -maxh 72 &> log.log

echo "... Job Finished at `date`"
