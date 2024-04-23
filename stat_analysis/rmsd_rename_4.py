with open('rmsd_analyze_bent_2.txt', 'r') as rmsd_bent:
	original = rmsd_bent.read()
	new = original.replace('bent_beta_I_s', 'Beta_I')\
				  .replace('bent_calf_1_s', 'Calf_1')\
				  .replace('bent_E2_s', 'E2')\
				  .replace('bent_hybrid_s', 'Hybrid')\
				  .replace('bent_beta_propeller_s', 'beta_propeller')\
				  .replace('bent_calf_2_s', 'Calf_2')\
				  .replace('bent_E3_s', 'E3')\
				  .replace('bent_psi_s', 'Psi')\
				  .replace('bent_beta_T_s', 'Beta_T')\
				  .replace('bent_E1_s', 'E1')\
				  .replace('bent_E4_s', 'E4')\
				  .replace('bent_thigh_s', 'thigh')

with open('rmsd_analyze_bent_2_renamed.txt', 'w') as rmsd_bent:
	rmsd_bent.write(new)
