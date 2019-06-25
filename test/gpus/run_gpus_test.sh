#!/bin/bash



#SBATCH --job-name=tes_gpus_number
#SBATCH --partition=gpu
#SBATCH --gres=gpu:2
#SBATCH --account=g.alex039
#SBATCH --nodes=1
#SBATCH --ntasks=8
#SBATCH --time=00:15:00

source ~/data/anaconda3/bin/activate
module load CUDA


cd ~/data/tsn_paper/server_scripts/test/gpus/
python3 test_gpus.py 
