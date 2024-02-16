cgmap --verbose 1 --map bent_map_domain.yaml --out bent_4_microsecond_c_alpha_cg.trr --traj bent_4_microsecond_c_alpha.trr
python3 merging_hybrid.py bent_4_microsecond_c_alpha_cg
cghenm --traj bent_4_microsecond_c_alpha_cg_merged.trr \
	   --temp 310 --cut 300.0 --maxiter 100000 --sdmax 10000 --sdftol 0.00001 \
 	   --save bent_4_microsecond_c_alpha_cg_merged_henm \
 	   --verbose 1
cghenm --traj bent_4_microsecond_c_alpha_cg_merged.trr,skip=20000 \
	   --temp 310 --cut 300.0 --maxiter 100000 --sdmax 10000 --sdftol 0.00001 \
 	   --save bent_4_microsecond_c_alpha_cg_merged_skip_henm \
 	   --verbose 1