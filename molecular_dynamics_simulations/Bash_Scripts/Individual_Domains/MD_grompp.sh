module --force purge
module load gcc/11.2.0 openmpi/4.1.4 gromacs/2022.3-gpu

gmx_mpi grompp -f step5_production.mdp -p topol.top -c step4.1.gro -n index.ndx -o step5.0.tpr -r step4.1.gro -maxwarn 1 