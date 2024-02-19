module --force purge
module load gcc/11.2.0 openmpi/4.1.4 gromacs/2022.3-gpu

mpirun -np 1 gmx_mpi grompp -f step4.0_minimization.mdp -p topol.top -c step3_input.gro -n index.ndx -o step4.0.tpr -r step3_input.pdb -maxwarn 1
mpirun -np 1 gmx_mpi mdrun -deffnm step4.0

mpirun -np 1 gmx_mpi grompp -f step4.1_equilibration.mdp -p topol.top -c step4.0.gro -n index.ndx -o step4.1.tpr -r step4.0.gro -maxwarn 1
