import numpy as np
import sys

input_filename = sys.argv[1]
n_replica = int(sys.argv[2])

with open(input_filename, 'r') as input_file:
	print('# {} {} {} {}'.format('template', 'mean', 'std.dev.', 'neff'))
	for j, line in enumerate(input_file):
		if j%n_replica == 0:
			template = line.split()[0][:-4]
			ns = []
			neffs = []
			means = []
			stds = []
		mean, std, n, neff = line.split()[1:]
		means.append(float(mean))
		stds.append(float(std))
		ns.append(int(n))
		neffs.append(int(neff))
		if j%n_replica == n_replica-1:
			means = np.array(means)
			stds = np.array(stds)
			ns = np.array(ns)
			neffs = np.array(neffs)
			wmean = np.dot(neffs,means)/np.sum(neffs)
			wstd = np.sqrt(np.dot((neffs-1),stds**2)/np.sum(neffs-1))
			wneff = np.sum(neffs)
			wtemplate = template.split('/')[-1].replace('-','_')
			print('{} {} {} {}'.format(wtemplate, wmean, wstd, wneff))
