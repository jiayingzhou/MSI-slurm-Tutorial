# MSI-slurm-Tutorial

This doc is for the convenience of running Slurm jobs on MSI platform in University of Minnesota.

What you need: 

1. Your MSI account with specific cluster, e.g., xxxx0000@mangi.msi.umn.edu. “Xxxx” is your UMN x500, and mangi is the cluster name. You can choose other clusters, see https://www.msi.umn.edu/partitions .

2.Your project as well as a slurm script. A slurm script example can be found in https://www.msi.umn.edu/content/job-submission-and-scheduling-slurm. I will recommend my slurm script run.sh.

To run a job in MSI using slurm, you will need:

1. Login your MSI account by typing
```
ssh xxxx0000@mangi.msi.umn.edu
```

2. Upload your project to the MSI:
```
scp -r your_local_project_path xxxx0000@mangi.msi.umn.edu:your_msi_project_path
```

3. Build conda environment and install packages, to install pytorch correctly, I use mamba to install pytorch packages. A very short tutorial is https://www.youtube.com/watch?v=N30h6WPr09M&list=PLKCHj1lyf_OLPvyUG_EpzDv61aL3FvuHM&index=4&t=222s. For example, I install an environment named pytorch_env, and install pytroch at the cuda version = 11.3. 
```
module load mamba
mamba create -n pytorch_env
conda activate pytorch
mamba install pytorch cudatoolkit=11.3 -c pytorch_env
```

4. You can then install packages in the conda environment. 

5. To run your job, you need to specify a conda path (as well as the python path). You can specify your conda version by 
```
cd /panfs/roc/msisoft/anaconda
```
And find your specified conda path, source the path in your script.

6. You should be able to run your job. 
