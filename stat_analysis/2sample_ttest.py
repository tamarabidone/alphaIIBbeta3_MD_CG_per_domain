import sys
import numpy as np

from effective_sample_size import ttest

filename1 = sys.argv[1]
filename2 = sys.argv[2]
alpha = float(sys.argv[3])

file1_dict = {}
file2_dict = {}

def read_data_to_dict(data_filename, dicto):

	with open(data_filename, 'r') as file:
		for line in file:
			if line[0] == '#':
				pass
			else:
				entries = line.split()
				dicto[entries[0]] = (float(entries[1]), float(entries[2]), int(entries[3]))

read_data_to_dict(filename1, file1_dict)
read_data_to_dict(filename2, file2_dict)

all_keys = set( list(file1_dict.keys()) + list(file2_dict.keys()) )

print('# mean_bent mean_int1 stderr_bent stderr_int1 p')

for key in all_keys:
	if not (key in file1_dict.keys() and key in file2_dict.keys()):
		pass
	else:
		t, p = ttest(file1_dict[key][0], file2_dict[key][0], file1_dict[key][1], file2_dict[key][1], file1_dict[key][2], file2_dict[key][2])
		print('{} {} {} {} {} {}'.format(key, file1_dict[key][0], file2_dict[key][0], file1_dict[key][1]/np.sqrt(file1_dict[key][2]), file2_dict[key][1]/np.sqrt(file2_dict[key][2]), p))