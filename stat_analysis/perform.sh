# RADII OF GYRATION

for i in $(cat gyradii_filenames.txt); do python3 errorbars.py data/"$i" 2000 0.05 27; done > gyradii_errorbars_free.txt
python3 analyze.py gyradii_errorbars_free.txt 3 > gyradii_analyze_free.txt
python3 gyradii_rename.py

for i in $(cat gyradii_filenames_bent.txt); do python3 errorbars.py data/"$i" 20000 0.05 0; done > gyradii_errorbars_bent.txt
python3 analyze.py gyradii_errorbars_bent.txt 1 > gyradii_analyze_bent.txt

for i in $(cat gyradii_filenames_int1.txt); do python3 errorbars.py data/"$i" 20000 0.05 0; done > gyradii_errorbars_int1.txt
python3 analyze.py gyradii_errorbars_int1.txt 1 > gyradii_analyze_int1.txt

python3 3sample_ttest.py gyradii_analyze_free_renamed.txt gyradii_analyze_bent.txt gyradii_analyze_int1.txt 0.05 > gyradii_p_values.txt
python3 gyradii_rename_2.py

# RMSD

for i in $(cat rmsd_filenames_2.txt); do python3 errorbars.py data/"$i" 2000 0.05 0; done > rmsd_errorbars_free_2.txt
python3 analyze.py rmsd_errorbars_free_2.txt 1 > rmsd_analyze_free_2.txt
python3 rmsd_rename_3.py

for i in $(cat rmsd_filenames_bent_2.txt); do python3 errorbars.py data/"$i" 0 0.05 0; done > rmsd_errorbars_bent_2.txt
python3 analyze.py rmsd_errorbars_bent_2.txt 1 > rmsd_analyze_bent_2.txt
python3 rmsd_rename_4.py

for i in $(cat rmsd_filenames_int1_2.txt); do python3 errorbars.py data/"$i" 0 0.05 0; done > rmsd_errorbars_int1_2.txt
python3 analyze.py rmsd_errorbars_int1_2.txt 1 > rmsd_analyze_int1_2.txt
python3 rmsd_rename_5.py

python3 3sample_ttest.py rmsd_analyze_free_2_renamed.txt rmsd_analyze_bent_2_renamed.txt rmsd_analyze_int1_2_renamed.txt 0.05 > rmsd_p_values_2.txt
# python3 rmsd_rename_2.py

# RMSF

python3 3sample_ttest.py rmsf_analyze_free.txt rmsf_analyze_bent.txt rmsf_analyze_int1.txt 0.05 > rmsf_p_values.txt
python3 rmsf_convert.py > rmsf_p_values_nm.txt

# SASA

for i in $(cat sasa_filenames_bent.txt); do python3 errorbars.py data/"$i" 2000 0.05 24; done > sasa_errorbars_bent.txt
python3 analyze.py sasa_errorbars_bent.txt 1 > sasa_analyze_bent.txt

for i in $(cat sasa_filenames_int1.txt); do python3 errorbars.py data/"$i" 2000 0.05 24; done > sasa_errorbars_int1.txt
python3 analyze.py sasa_errorbars_int1.txt 1 > sasa_analyze_int1.txt

python3 2sample_ttest.py sasa_analyze_bent.txt sasa_analyze_int1.txt 0.05 > sasa_p_values.txt

# BURIED SASA

for i in $(cat bsasa_filenames_bent_2.txt); do python3 errorbars.py data/"$i" 2000 0.05 0; done > bsasa_errorbars_bent_2.txt
python3 analyze.py bsasa_errorbars_bent_2.txt 1 > bsasa_analyze_bent_2.txt

for i in $(cat bsasa_filenames_int1_2.txt); do python3 errorbars.py data/"$i" 2000 0.05 0; done > bsasa_errorbars_int1_2.txt
python3 analyze.py bsasa_errorbars_int1_2.txt 1 > bsasa_analyze_int1_2.txt

python3 2sample_ttest.py bsasa_analyze_bent_2.txt bsasa_analyze_int1_2.txt 0.05 > bsasa_p_values_2.txt