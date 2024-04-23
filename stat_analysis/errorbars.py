import sys
import numpy as np

from effective_sample_size import eff_sample_size, ttest_error

filename = sys.argv[1]
cutoff = int(sys.argv[2])
alpha = float(sys.argv[3])
skip = int(sys.argv[4])

data = np.genfromtxt(filename, skip_header=skip)

if len(np.shape(data)) > 1:
	t = np.transpose(data)[0]
	t = t[cutoff:]
	y_data = np.transpose(data)[1]
else:
	y_data = data

y_data = y_data[cutoff:]

y_mean = np.mean(y_data)
y_std = np.std(y_data, ddof=1)
n = len(y_data)
neff = eff_sample_size(y_data)

print('{} {} {} {} {}'.format(filename, y_mean, y_std, n, neff))