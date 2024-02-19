#!/bin/bash
# add in the SBATCH information here if you want to submmit this through SBATCH
# if you want to "source" the file make sure you salloc some resources before.

#SBATCH --time=4:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=16
#SBATCH --gres=gpu:1
#SBATCH --job-name=B1_fit
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

#echo "1" | gmx trjconv -f step5.0.xtc -s step5.0.tpr -o noPBCtest.xtc -pbc nojump 

echo -e "1\n1\n1" | gmx trjconv -f noPBCtest.xtc -s step5.0.tpr -o fit_test.xtc -center -fit rot+trans 


#if -pbc nojump wasn't sufficient use the below command on the output from the previous command
#echo "1" | gmx trjconv -f test.xtc -s step5_production.tpr -o test.xtc -pbc whole
