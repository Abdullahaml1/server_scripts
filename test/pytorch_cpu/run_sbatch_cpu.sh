#! /bin/bash

#SBATCH --job-name=test_pytorch_anaconda
#SBATCH --ntasks=24
#SBATCH --cpus-per-task=1
#SBATCH --time=00:15:00


source ~/data/anaconda3/bin/activate 

module load CUDA

cd ~/data/tsn_paper/server_scripts/test/pytorch_cpu/
python3 test_pytorch_cpu.py

