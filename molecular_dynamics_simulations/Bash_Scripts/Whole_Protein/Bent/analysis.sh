#!/bin/bash
# add in the SBATCH information here if you want to submmit this through SBATCH
# if you want to "source" the file make sure you salloc some resources before.

#SBATCH --time=2:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=16
# SBATCH --gres=gpu:1
#SBATCH --job-name=analysis
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

echo -e "3\n3" | gmx rms -s bent_1_microsecond_whole_protein_frame0.pdb -f bent_1_microsecond_whole_protein.xtc -o ca_rmsd_bent_whole_protein.xvg
echo -e "3" | gmx rmsf -s bent_1_microsecond_whole_protein_frame0.pdb -f bent_1_microsecond_whole_protein.xtc -res -o ca_rmsf_bent_whole_protein.xvg
echo -e "3" | gmx gyrate -s bent_1_microsecond_whole_protein_frame0.pdb -f bent_1_microsecond_whole_protein.xtc -o Rg_bent_whole_protein.xvg
echo -e "1" | gmx sasa -s bent_1_microsecond_whole_protein_frame0.pdb -f bent_1_microsecond_whole_protein.xtc -o sasa_bent_whole_protein.xvg
