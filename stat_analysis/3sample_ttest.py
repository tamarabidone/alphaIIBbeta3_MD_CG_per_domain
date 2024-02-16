import sys
import numpy as np

from effective_sample_size import ttest

filename1 = sys.argv[1]
filename2 = sys.argv[2]
filename3 = sys.argv[3]
alpha = float(sys.argv[4])

file1_dict = {}
file2_dict = {}
file3_dict = {}

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
read_data_to_dict(filename3, file3_dict)

all_keys = set( list(file1_dict.keys()) + list(file2_dict.keys()) + list(file3_dict.keys()) )

print('# mean_dom mean_bent mean_int1 stderr_dom stderr_bent stderr_int1 p_d_b p_b_i p_d_i')

for key in all_keys:
	if not (key in file1_dict.keys() and key in file2_dict.keys() and key in file3_dict.keys()):
		pass
	else:
		t12, p12 = ttest(file1_dict[key][0], file2_dict[key][0], file1_dict[key][1], file2_dict[key][1], file1_dict[key][2], file2_dict[key][2])
		t23, p23 = ttest(file2_dict[key][0], file3_dict[key][0], file2_dict[key][1], file3_dict[key][1], file2_dict[key][2], file3_dict[key][2])
		t13, p13 = ttest(file1_dict[key][0], file3_dict[key][0], file1_dict[key][1], file3_dict[key][1], file1_dict[key][2], file3_dict[key][2])
		print('{} {} {} {} {} {} {} {} {} {}'.format(key, file1_dict[key][0], file2_dict[key][0], file3_dict[key][0], file1_dict[key][1]/np.sqrt(file1_dict[key][2]), file2_dict[key][1]/np.sqrt(file2_dict[key][2]), file3_dict[key][1]/np.sqrt(file3_dict[key][2]), p12, p23, p13))