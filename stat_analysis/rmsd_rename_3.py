with open('rmsd_analyze_free_2.txt', 'r') as rmsd_free:
	original = rmsd_free.read()
	new = original.replace('Beta_I_average_rmsd', 'Beta_I')\
				  .replace('Calf_1_average_rmsd', 'Calf_1')\
				  .replace('E2_average_rmsd', 'E2')\
				  .replace('Hybrid_average_rmsd', 'Hybrid')\
				  .replace('beta_propeller_average_rmsd', 'beta_propeller')\
				  .replace('Calf_2_average_rmsd', 'Calf_2')\
				  .replace('E3_average_rmsd', 'E3')\
				  .replace('Psi_average_rmsd', 'Psi')\
				  .replace('Beta_T_average_rmsd', 'Beta_T')\
				  .replace('E1_average_rmsd', 'E1')\
				  .replace('E4_average_rmsd', 'E4')\
				  .replace('thigh_average_rmsd', 'thigh')

with open('rmsd_analyze_free_2_renamed.txt', 'w') as rmsd_free:
	rmsd_free.write(new)
