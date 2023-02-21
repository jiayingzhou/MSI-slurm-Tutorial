# MSI-slurm-Tutorial

This document provides guidance on running Slurm jobs on the MSI platform at the University of Minnesota for convenience.

What you need: 

Requirements:

A MSI account for a specific cluster, for instance, xxxx0000@mangi.msi.umn.edu. "Xxxx" refers to your UMN x500, and "mangi" is the cluster name. You may select other clusters, refer to https://www.msi.umn.edu/partitions.

Your project and a slurm script. You can find an example of a slurm script at https://www.msi.umn.edu/content/job-submission-and-scheduling-slurm. I recommend using my slurm script, run.sh.
To run a job on MSI using slurm, you need to:

1. Log in to your MSI account by typing:
```
ssh xxxx0000@mangi.msi.umn.edu
```

2. Upload your project to MSI:
```
scp -r your_local_project_path xxxx0000@mangi.msi.umn.edu:your_msi_project_path
```

3. Build a conda environment and install packages. To install pytorch correctly, you can use mamba. You can find a brief tutorial at https://www.youtube.com/watch?v=N30h6WPr09M&list=PLKCHj1lyf_OLPvyUG_EpzDv61aL3FvuHM&index=4&t=222s. For example, to install an environment named pytorch_env and install pytorch at the cuda version = 11.3, type:
```
module load mamba
mamba create -n pytorch_env
conda activate pytorch
mamba install pytorch cudatoolkit=11.3 -c pytorch_env
```

4. Install packages in the conda environment.

5. To run your job, you need to specify a conda path (as well as the python path). You can specify your conda version by: 
```
cd /panfs/roc/msisoft/anaconda
```
And locate your specified conda path, then source the path in your script.


6. Run the job. 


## Notice

1. It is advisable to regularly clean your slurm error/output file. You can use the following command to clean all files starting with "slurm":
```
find  . -name 'slurm*' -exec rm {} \;
```
Note that you should not name any file starting with "slurm" if you clean slurm output this way.



2. If you frequently check a path, you can export your job name by editing in ~/.bashrc:

```
vi ~/.bashrc
```
For example, you could add a line
```
export JOB=/scratch.global/xxxx0000
```
Once you save your change, type
```
source ~/.bashrc
```
Then you should be able to go to "scratch.global/xxxx0000" by
```
cd $JOB
```
