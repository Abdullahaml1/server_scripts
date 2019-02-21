#!/bin/bash



#SBATCH --job-name=test-ssh-tunnel
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=2:00:00

source ~/data/anaconda3/bin/activate
export LD_PRELOAD="/home/alex039u2/data/anaconda3/glibc-2.14/lib/libc.so.6"
module load CUDA/8.0.61

hostname -I
netstat -antu

jupyter-lab  --no-browser --port=38888 > jupyter.log 2>&1 &
ssh -R localhost:38888:localhost:38888 login01 -N







