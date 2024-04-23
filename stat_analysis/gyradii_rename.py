with open('gyradii_analyze_free.txt', 'r') as gyradii_free:
	original = gyradii_free.read()
	# print(original)
	# print()
	new = original.replace('Rg_Domain_1_Beta_Propeller_Replica_1', 'Domain_1_rg')\
				  .replace('Rg_Domain_2_Thigh_Replica_1', 'Domain_2_rg')\
				  .replace('Rg_Domain_3_Calf_1_Replica_1', 'Domain_3_rg')\
				  .replace('Rg_Domain_4_Calf_2_Replica_1', 'Domain_4_rg')\
				  .replace('Rg_Domain_6_Psi_Replica_1', 'Domain_5_rg')\
				  .replace('Rg_Domain_7_Hybrid_Replica_1', 'Domain_6_rg')\
				  .replace('Rg_Domain_8_Beta_I_Replica_1', 'Domain_7_rg')\
				  .replace('Rg_Domain_9_E1_Replica_1', 'Domain_8_rg')\
				  .replace('Rg_Domain_10_E2_Replica_1', 'Domain_9_rg')\
				  .replace('Rg_Domain_11_E3_Replica_1', 'Domain_10_rg')\
				  .replace('Rg_Domain_12_E4_Replica_1', 'Domain_11_rg')\
				  .replace('Rg_Domain_13_Beta_T_Replica_1', 'Domain_12_rg')
	# print(new)

with open('gyradii_analyze_free_renamed.txt', 'w') as gyradii_free:
	gyradii_free.write(new)