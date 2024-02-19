#!/bin/bash
# add in the SBATCH information here if you want to submmit this through SBATCH
# if you want to "source" the file make sure you salloc some resources before.

#SBATCH --time=3:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=16
#SBATCH --gres=gpu:1
#SBATCH --job-name=convert
#SBATCH --out=consoleoutput.out
#SBATCH --error=error.err
#SBATCH --mail-type=all
#SBATCH --mail-user=onkar.joshi@sci.utah.edu
#SBATCH --account=notchpeak-shared-short
#SBATCH --partition=notchpeak-shared-short
#SBATCH --array=1-1%1


ml purge
ml use /uufs/chpc.utah.edu/common/home/u6048150/spack/local/modules/linux-rocky8-x86_64/Compiler/linux-rocky8-broadwell/gcc/11.2.0
ml use /uufs/chpc.utah.edu/common/home/u6048150/spack/local/modules/linux-rocky8-x86_64/Compiler/linux-rocky8-x86_64/gcc/11.2.0
ml gcc/11.2.0 gromacs/2022.5-gpu

echo "3" | gmx trjconv -f bent_0_to_3500_ns.xtc -s bent_0_550ns_dudu_frame_0.pdb -o bent_4_microsecond_c_alpha.xtc
echo "3" | gmx trjconv -f bent_0_to_3500_ns.xtc -s bent_0_550ns_dudu_frame_0.pdb -o bent_4_microsecond_c_alpha_frame0.pdb -dump 3