#!/bin/bash
#SBATCH --time=24:00:00 # walltime (-t)
#SBATCH --nodes=1 # number of cluster nodes (-N).
#SBATCH --ntasks=5 # number of MPI tasks (-n).
#SBATCH -o slurm-%j.out-%N # name of the stdout, using the job number (%j) and the first node (%N).
#SBATCH -e slurm-%j.err-%N # name of the stderr, using the job number (%j) and the first node (%N).
#SBATCH -p v100    
#SBATCH --gres=gpu:v100:1 # gpu (type:name:requested_number).
#SBATCH --mem=10g # 
#SBATCH --tmp=10g
#SBATCH --mail-type=ALL  
#SBATCH --mail-user=xxxx0000@umn.edu 

# Set up whatever packages we need to run with.

export WORKDIR=$HOME/project4

# Set up the temporary directory.
export SCRDIR=/scratch.global/$USER/$SLURM_JOBID
mkdir -p $SCRDIR

# Go to the working directory.
cd $SCRDIR

# Copy all the files (with time) from current directory ($HOME) to the working directory (scratch) 
cp -pr  $WORKDIR/* $SCRDIR

# go to where the py locates
cd your_work_directory/



source /panfs/roc/msisoft/anaconda/anaconda3_2020.07/etc/profile.d/conda.sh
conda activate pytorch_env

python3.10 main.py 

# Move files out of working directory to home, and clean up.
cp -pr your_result_directory_in_job/ $HOME/your_result_directory_at_home
rm -rf $SCRDIR # delete the running job folder



