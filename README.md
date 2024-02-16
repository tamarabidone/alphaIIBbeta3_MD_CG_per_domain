# alphaIIBbeta3_bent_int_transition

## Coarse-graining

To run coarse-graining scripts, type:
```shell
cd coarse_graining/
bash bent_cgmap.sh
bash int1_cgmap.sh
```
You need to install [OpenMSCG](https://software.rcc.uchicago.edu/mscg/) before.

## Coarse-grained simulations

To run coarse-grained BD simulations, type:
```shell
cd coarse_grained_simulations/
bash perform.sh
```
You need to install [LAMMPS](https://docs.lammps.org/Manual.html) before.

## Statistical analysis

To run statistical analysis scripts, type:
```shell
cd stat_analysis/
bash perform.sh
```
Results will appear in the same directory. Our results are stored in ``stat_analysis/results/`` subdirectory.