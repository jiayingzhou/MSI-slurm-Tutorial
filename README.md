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
