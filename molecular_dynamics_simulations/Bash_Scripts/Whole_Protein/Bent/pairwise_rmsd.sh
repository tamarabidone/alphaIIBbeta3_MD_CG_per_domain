#!/bin/bash

#SBATCH --time=4:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=16
#SBATCH --gres=gpu:1
#SBATCH --job-name=rmsd_bent
#SBATCH --out=consoleoutput.out
#SBATCH --error=error.err
#SBATCH --mail-type=all
#SBATCH --mail-user=onkar.joshi@sci.utah.edu
#SBATCH --account=notchpeak-shared-short
#SBATCH --partition=notchpeak-shared-short
#SBATCH --array=1-1%1

module purge
module load python
pip install MDAnalysis

python << EOF
import numpy as np
from matplotlib.ticker import (MultipleLocator, FormatStrFormatter, AutoMinorLocator, FuncFormatter)
import os
import sys
import MDAnalysis as mda
import MDAnalysis.analysis.pca as pca
import MDAnalysis.analysis.align as align
import MDAnalysis.analysis.diffusionmap as diffusionmap
from MDAnalysis.analysis.rms import rmsd, RMSD
pdb_file = 'bent_0_550ns_dudu_frame_0.pdb'
xtc_file = 'bent_4_microsecond_c_alpha_skip_10.xtc'
bent = u = mda.Universe(pdb_file, xtc_file)
aligner = align.AlignTraj(bent, bent, select='all', in_memory=True).run()
matrix = diffusionmap.DistanceMatrix(bent, select='all').run()
np.save('rmsd_bent_1to1_skip10.npy', matrix.dist_matrix/10)
EOF
