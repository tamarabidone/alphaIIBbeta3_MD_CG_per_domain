import numpy as np

data = np.loadtxt('rmsf_p_values.txt', dtype={'names': ('domain', 'free_mean', 'bent_mean', 'int1_mean', 'free_std', 'bent_std', 'int1_std', 'p12', 'p23', 'p13'),
                     'formats': ('S20', float, float, float, float, float, float, float, float, float)})

data_new = [[] for j in range(12)]

print("mean_dom mean_bent mean_int1 stderr_dom stderr_bent stderr_int1 p_d_b p_b_i p_d_i")

for j, line in enumerate(data):
	a=line[0]#.decode("UTF-8")
	# print(type(a))
	# print(a)
	a=line[0].decode("UTF-8")
	# print(type(a))
	# print(a)
	line[0]=a
	# line[1]/=10
	# line[2]/=10
	# line[3]/=10
	# line[4]/=10
	print('{} {} {} {} {} {} {} {} {} {}'.format(a, line[1]/10, line[2]/10, line[3]/10, line[4]/10, line[5]/10, line[6]/10, line[7], line[8], line[9]))