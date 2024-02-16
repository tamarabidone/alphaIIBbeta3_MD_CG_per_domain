import MDAnalysis as mda
import MDAnalysis.transformations
from MDAnalysis.core.groups import AtomGroup
import numpy as np
from tqdm import tqdm

import matplotlib.pyplot as plt

import sys

template = sys.argv[1]

INPUT_TRR_FILES = [template+'.trr']
OUTPUT_TRR_FILES = [template+'_merged.trr']

# INPUT_TRR_FILES = ["int1_4_microsecond_c_alpha_cg_unwrapped.trr"]
# OUTPUT_TRR_FILES = ["int1_4_microsecond_c_alpha_cg_unwrapped_merged.trr"]
# INPUT_TRR_FILES = ["bent_0_to_3500_ns_c_alpha_cg.trr"]
# OUTPUT_TRR_FILES = ["bent_0_to_3500_ns_c_alpha_cg_merged.trr"]

for index in range(len(INPUT_TRR_FILES)):
	u = mda.Universe(INPUT_TRR_FILES[index])
	protein = u.select_atoms("all")
	with mda.Writer(OUTPUT_TRR_FILES[index], n_atoms=protein.n_atoms-1) as W:
		for ts in u.trajectory:
			# print(protein.atoms.positions)
			# print(protein.atoms.positions[6])
			# print(protein.atoms.positions[8])
			# print(52/132*protein.atoms[6].position+80/132*protein.atoms[8].position)
			protein.atoms[6].position = 52/132*protein.atoms[6].position+80/132*protein.atoms[8].position
			protein.atoms[8].position = 0.0
			# print(protein.atoms.positions)
			# print(list(protein.atoms[:8].positions)+list(protein.atoms[9:].positions))
			# print()
			W.write(protein.atoms[:8]+protein.atoms[9:])
