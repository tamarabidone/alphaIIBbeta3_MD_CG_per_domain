#!/bin/bash
# add in the SBATCH information here if you want to submmit this through SBATCH
# if you want to "source" the file make sure you salloc some resources before.

#SBATCH --time=4:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=16
#SBATCH --gres=gpu:1
#SBATCH --job-name=fit-2
#SBATCH --out=consoleoutput.out
#SBATCH --error=error.err
#SBATCH --mail-type=all
#SBATCH --mail-user=onkar.joshi@sci.utah.edu
#SBATCH --account=bidone-gpu-np
#SBATCH --partition=bidone-gpu-np
#SBATCH --array=1-1%1


ml purge
ml use /uufs/chpc.utah.edu/common/home/u6048150/spack/local/modules/linux-rocky8-x86_64/Compiler/linux-rocky8-broadwell/gcc/11.2.0
ml use /uufs/chpc.utah.edu/common/home/u6048150/spack/local/modules/linux-rocky8-x86_64/Compiler/linux-rocky8-x86_64/gcc/11.2.0
ml gcc/11.2.0 gromacs/2022.5-gpu

#echo "1" | gmx trjconv -f int1_combined.trr -s frame0_centerA.pdb -o noPBCtest1.xtc -pbc nojump
echo "1" | gmx trjconv -f noPBCtest1.xtc -s noPBCtest1_frame0.pdb -o noPBCtest1_frame5.pdb -dump 5

echo -e "1\n1\n1" | gmx trjconv -f noPBCtest1.xtc -s noPBCtest1_frame5.pdb -o fit_test1.xtc -center -fit rot+trans 
