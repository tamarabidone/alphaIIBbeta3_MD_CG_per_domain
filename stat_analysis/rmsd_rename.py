with open('rmsd_analyze_free.txt', 'r') as rmsd_free:
	original = rmsd_free.read()
	new = original.replace('ca_rmsd_Domain_1_Beta_Propeller_Replica_1', 'Domain_1_rmsd')\
				  .replace('ca_rmsd_Domain_2_Thigh_Replica_1', 'Domain_2_rmsd')\
				  .replace('ca_rmsd_Domain_3_Calf_1_Replica_1', 'Domain_3_rmsd')\
				  .replace('ca_rmsd_Domain_4_Calf_2_Replica_1', 'Domain_4_rmsd')\
				  .replace('ca_rmsd_Domain_6_Psi_Replica_1', 'Domain_5_rmsd')\
				  .replace('ca_rmsd_Domain_7_Hybrid_Replica_1', 'Domain_6_rmsd')\
				  .replace('ca_rmsd_Domain_8_Beta_I_Replica_1', 'Domain_7_rmsd')\
				  .replace('ca_rmsd_Domain_9_E1_Replica_1', 'Domain_8_rmsd')\
				  .replace('ca_rmsd_Domain_10_E2_Replica_1', 'Domain_9_rmsd')\
				  .replace('ca_rmsd_Domain_11_E3_Replica_1', 'Domain_10_rmsd')\
				  .replace('ca_rmsd_Domain_12_E4_Replica_1', 'Domain_11_rmsd')\
				  .replace('ca_rmsd_Domain_13_Beta_T_Replica_1', 'Domain_12_rmsd')

with open('rmsd_analyze_free_renamed.txt', 'w') as rmsd_free:
	rmsd_free.write(new)