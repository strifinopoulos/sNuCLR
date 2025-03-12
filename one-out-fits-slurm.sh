#!/bin/bash
#
#SBATCH --job-name=test
#SBATCH --output=res_%j.txt
#SBATCH --error=err_%j.txt
#
#SBATCH --time=100:00:00
#SBATCH --mem-per-cpu=2000

srun source activate base
srun conda activate kateenv
export REMOVE_N=$1
export REMOVE_Z=$2
srun jupyter nbconvert --execute --to notebook --inplace --parameters="--remove_z=$removeZ --remove_n=$removeN" modified_fits.ipynb
