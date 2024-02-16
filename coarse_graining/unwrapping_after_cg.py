import MDAnalysis as mda
import MDAnalysis.transformations
from MDAnalysis.core.groups import AtomGroup
import numpy as np
from tqdm import tqdm
import sys

import matplotlib.pyplot as plt

template = sys.argv[1]

INPUT_TRR_FILES = [template+".trr"]
OUTPUT_TRR_FILES = [template+"_unwrapped.trr"]

neighbors = [4, 3, 2, 1, 0, 7, 6, 5, 8, 9, 10, 11, 12, 13, 14]

for index in range(len(INPUT_TRR_FILES)):
	u = mda.Universe(INPUT_TRR_FILES[index])
	protein = u.select_atoms("all")
	with mda.Writer(OUTPUT_TRR_FILES[index], n_atoms=protein.n_atoms) as W:
		for ts in u.trajectory:
			# ts.dimensions[:3]*=1000
			dims = ts.dimensions[:3]
			unit = np.identity(3)	
			for index in range(protein.n_atoms-1):
				ri1 = protein.atoms[neighbors[index+1]].position
				ri = protein.atoms[neighbors[index]].position
				a = AtomGroup([protein.atoms[neighbors[index+1]]])
				for i in range(3):
					while ri1[i]-ri[i] > dims[i]/2:
						a.translate(-np.dot(dims[i], unit[i]))
						ri1[i] -= dims[i]
					while ri1[i]-ri[i] < -dims[i]/2:
						a.translate(np.dot(dims[i], unit[i]))
						ri1[i] += dims[i]
			cog = protein.center_of_geometry()
			for i in range(3):
				while cog[i] > dims[i]/2:
					protein.translate(-np.dot(dims[i], unit[i]))
					cog[i] -= dims[i]
				while cog[i] < -dims[i]/2:
					protein.translate(np.dot(dims[i], unit[i]))
					cog[i] += dims[i]
			cog = protein.center_of_geometry()
			tdim = ts.triclinic_dimensions
			box_center = np.sum(tdim, axis=0) / 2
			protein.translate(box_center - cog)
			W.write(protein)
