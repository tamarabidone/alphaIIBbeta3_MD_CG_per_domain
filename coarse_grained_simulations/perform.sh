lmp_serial -var seed1 `bash -c 'echo $RANDOM'` -in in.bent_merged_skip.txt
lmp_serial -var seed1 `bash -c 'echo $RANDOM'` -in in.int1_merged_skip.txt
lmp_serial -var seed1 `bash -c 'echo $RANDOM'` -in in.bent_with_int1_henm_merged.txt
lmp_serial -var seed1 `bash -c 'echo $RANDOM'` -in in.bent_broken_3_merged.txt
lmp_serial -var seed1 `bash -c 'echo $RANDOM'` -in in.bent_with_int1_henm_broken_3_merged.txt


























	   

# lmp_serial -var seed1 `bash -c 'echo $RANDOM'` -in in.bent_broken_merged.txt
# xyz_to_trr -x bent_broken_merged.xyz -t bent_broken_merged.trr
# align_traj -t bent_broken_merged.trr -r bent_broken_merged.trr -n -1 -o bent_broken_merged_align.trr
# cghenm --traj bent_broken_merged.trr \
# 	   --temp 310 --cut 300.0 --maxiter 100000 --sdmax 10000 --sdftol 0.00001 \
# 	   --save bent_broken_merged_henm \
# 	   --verbose 1

# lmp_serial -var seed1 `bash -c 'echo $RANDOM'` -in in.bent_with_int1_henm_broken_merged.txt
# xyz_to_trr -x bent_with_int1_henm_broken_merged.xyz -t bent_with_int1_henm_broken_merged.trr
# align_traj -t bent_with_int1_henm_broken_merged.trr -r bent_with_int1_henm_broken_merged.trr -n -1 -o bent_with_int1_henm_broken_merged_align.trr
# cghenm --traj bent_with_int1_henm_broken_merged.trr \
# 	   --temp 310 --cut 300.0 --maxiter 100000 --sdmax 10000 --sdftol 0.00001 \
# 	   --save bent_with_int1_henm_broken_merged_henm \
# 	   --verbose 1

# lmp_serial -var seed1 `bash -c 'echo $RANDOM'` -in in.int1_merged_2.txt
# xyz_to_trr -x int1_merged_2.xyz -t int1_merged_2.trr
# align_traj -t int1_merged_2.trr -r int1_merged_2.trr -n -1 -o int1_merged_2_align.trr

# lmp_serial -var seed1 `bash -c 'echo $RANDOM'` -in in.bent_with_int1_henm_merged.txt
# xyz_to_trr -x bent_with_int1_henm_merged.xyz -t bent_with_int1_henm_merged.trr
# align_traj -t bent_with_int1_henm_merged.trr -r bent_with_int1_henm_merged.trr -n -1 -o bent_with_int1_henm_merged_align.trr
# cghenm --traj bent_with_int1_henm_merged.trr \
# 	   --temp 310 --cut 300.0 --maxiter 100000 --sdmax 10000 --sdftol 0.00001 \
# 	   --save bent_with_int1_henm_merged_henm \
# 	   --verbose 1

# lmp_serial -var seed1 `bash -c 'echo $RANDOM'` -in in.int1_with_bent_henm_merged.txt
# xyz_to_trr -x int1_with_bent_henm_merged.xyz -t int1_with_bent_henm_merged.trr
# align_traj -t int1_with_bent_henm_merged.trr -r int1_with_bent_henm_merged.trr -n -1 -o int1_with_bent_henm_merged_align.trr

# lmp_serial -var seed1 `bash -c 'echo $RANDOM'` -in in.bent_with_int1_henm_merged_hot.txt
# xyz_to_trr -x bent_with_int1_henm_merged_hot.xyz -t bent_with_int1_henm_merged_hot.trr
# align_traj -t bent_with_int1_henm_merged_hot.trr -r bent_with_int1_henm_merged_hot.trr -n -1 -o bent_with_int1_henm_merged_hot_align.trr