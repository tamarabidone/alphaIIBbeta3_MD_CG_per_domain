cgmap --verbose 1 --map int1_map_domain.yaml --out int1_4_microsecond_c_alpha_cg.trr --traj int1_4_microsecond_c_alpha.trr
python3 unwrapping_after_cg.py int1_4_microsecond_c_alpha_cg
python3 merging_hybrid.py int1_4_microsecond_c_alpha_cg_unwrapped
cghenm --traj int1_4_microsecond_c_alpha_cg_unwrapped_merged.trr,skip=20000 \
	   --temp 310 --cut 300.0 --maxiter 100000 --sdmax 10000 --sdftol 0.00001 \
 	   --save int1_4_microsecond_c_alpha_cg_unwrapped_merged_end_henm \
 	   --verbose 1
cghenm --traj int1_4_microsecond_c_alpha_cg_unwrapped_merged.trr,frames=10000 \
	   --temp 310 --cut 300.0 --maxiter 100000 --sdmax 10000 --sdftol 0.00001 \
 	   --save int1_4_microsecond_c_alpha_cg_unwrapped_merged_start_henm \
 	   --verbose 1
cghenm --traj int1_4_microsecond_c_alpha_cg_unwrapped_merged.trr,skip=10000,frames=10000 \
	   --temp 310 --cut 300.0 --maxiter 100000 --sdmax 10000 --sdftol 0.00001 \
 	   --save int1_4_microsecond_c_alpha_cg_unwrapped_merged_mid_henm \
 	   --verbose 1