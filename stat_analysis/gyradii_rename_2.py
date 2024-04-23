with open('gyradii_p_values.txt', 'r') as gyradii:
	original = gyradii.read().split('\n')
	if original[-1] == '': original.pop(-1)
	# if original[0][0] == '#': original.pop(0)
	new = [None for _ in range(13)]
	for element in original:
		if element[0] == '#':
			new[0] = element
			continue
		n = int(element.split()[0].split('_')[1])
		new_element = element.replace('Domain_1_rg', 'Beta_Propeller')\
					  		 .replace('Domain_2_rg', 'Thigh')\
					  		 .replace('Domain_3_rg', 'Calf_1')\
					  		 .replace('Domain_4_rg', 'Calf_2')\
					  		 .replace('Domain_5_rg', 'Psi')\
					  		 .replace('Domain_6_rg', 'Hybrid')\
					  		 .replace('Domain_7_rg', 'Beta_I')\
					  		 .replace('Domain_8_rg', 'E1')\
					  		 .replace('Domain_9_rg', 'E2')\
					  		 .replace('Domain_10_rg', 'E3')\
					  		 .replace('Domain_11_rg', 'E4')\
					  		 .replace('Domain_12_rg', 'Beta_T')
		new[n] = new_element

with open('gyradii_p_values_renamed.txt', 'w') as gyradii:
	gyradii.write('\n'.join(new))