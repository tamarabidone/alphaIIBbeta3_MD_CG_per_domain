with open('rmsd_p_values.txt', 'r') as rmsd:
	original = rmsd.read().split('\n')
	if original[-1] == '': original.pop(-1)
	# if original[0][0] == '#': original.pop(0)
	new = [None for _ in range(13)]
	for element in original:
		if element[0] == '#':
			new[0] = element
			continue
		n = int(element.split()[0].split('_')[1])
		new_element = element.replace('Domain_1_rmsd', 'Beta_Propeller')\
					  		 .replace('Domain_2_rmsd', 'Thigh')\
					  		 .replace('Domain_3_rmsd', 'Calf_1')\
					  		 .replace('Domain_4_rmsd', 'Calf_2')\
					  		 .replace('Domain_5_rmsd', 'Psi')\
					  		 .replace('Domain_6_rmsd', 'Hybrid')\
					  		 .replace('Domain_7_rmsd', 'Beta_I')\
					  		 .replace('Domain_8_rmsd', 'E1')\
					  		 .replace('Domain_9_rmsd', 'E2')\
					  		 .replace('Domain_10_rmsd', 'E3')\
					  		 .replace('Domain_11_rmsd', 'E4')\
					  		 .replace('Domain_12_rmsd', 'Beta_T')
		new[n] = new_element

with open('rmsd_p_values_renamed.txt', 'w') as rmsd:
	rmsd.write('\n'.join(new))