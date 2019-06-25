#!/bin/bash



#SBATCH --job-name=test_pytorch_gpu_1
#SBATCH --partition=gpu
#SBATCH --gres=gpu:2
#SBATCH --ntasks=4
#SBATCH --account=g.alex039
#SBATCH --time=00:15:00

source ~/data/anaconda3/bin/activate 
module load CUDA


cd ~/data/tsn_paper/server_scripts/test/pytorch_cuda/
python3 test_pytorch_gpu.py

