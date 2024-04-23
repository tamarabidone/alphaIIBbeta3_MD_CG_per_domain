with open('rmsd_analyze_int1_2.txt', 'r') as rmsd_int1:
	original = rmsd_int1.read()
	new = original.replace('int1_beta_I_s', 'Beta_I')\
				  .replace('int1_calf_1_s', 'Calf_1')\
				  .replace('int1_E2_s', 'E2')\
				  .replace('int1_hybrid_s', 'Hybrid')\
				  .replace('int1_beta_propeller_s', 'beta_propeller')\
				  .replace('int1_calf_2_s', 'Calf_2')\
				  .replace('int1_E3_s', 'E3')\
				  .replace('int1_psi_s', 'Psi')\
				  .replace('int1_beta_T_s', 'Beta_T')\
				  .replace('int1_E1_s', 'E1')\
				  .replace('int1_E4_s', 'E4')\
				  .replace('int1_thigh_s', 'thigh')

with open('rmsd_analyze_int1_2_renamed.txt', 'w') as rmsd_int1:
	rmsd_int1.write(new)
