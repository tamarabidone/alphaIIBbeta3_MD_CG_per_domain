#!/bin/bash

#SBATCH --time=4:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=16
#SBATCH --gres=gpu:1
#SBATCH --job-name=rmsd_int
#SBATCH --out=consoleoutput.out
#SBATCH --error=error.err
#SBATCH --mail-type=all
#SBATCH --mail-user=onkar.joshi@sci.utah.edu
#SBATCH --account=notchpeak-shared-short
#SBATCH --partition=notchpeak-shared-short
#SBATCH --array=1-1%1

module purge
module load python

python << EOF
import numpy as np
from matplotlib.ticker import (MultipleLocator, FormatStrFormatter, AutoMinorLocator, FuncFormatter)
import os
import sys
#pip install MDAnalsyis
import MDAnalysis as mda
import MDAnalysis.analysis.pca as pca
import MDAnalysis.analysis.align as align
import MDAnalysis.analysis.diffusionmap as diffusionmap
from MDAnalysis.analysis.rms import rmsd, RMSD
pdb_file = 'int1_4_microsecond_c_alpha_frame0.pdb'
xtc_file = 'int1_4_microsecond_c_alpha_skip_10.xtc'
int1 = u = mda.Universe(pdb_file, xtc_file)
aligner = align.AlignTraj(int1, int1, select='all', in_memory=True).run()
matrix = diffusionmap.DistanceMatrix(int1, select='all').run()
np.save('rmsd_int1_1to1_skip10.npy', matrix.dist_matrix/10)
EOF
