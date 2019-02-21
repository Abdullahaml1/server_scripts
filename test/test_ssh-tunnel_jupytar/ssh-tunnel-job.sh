#!/bin/bash



#SBATCH --job-name=test-ssh-tunnel
#SBATCH --partition=gpu
#SBATCH --gres=gpu:2
#SBATCH --nodes=2
#SBATCH --ntasks=2
#SBATCH --time=2:00:00

source ~/data/anaconda3/bin/activate
export LD_PRELOAD="/home/alex039u2/data/anaconda3/glibc-2.14/lib/libc.so.6"
module load CUDA/8.0.61

hostname -I
netstat -antu

ssh -R localhost:6666:localhost:6666 head2 -N

cd ~/data/tsn_paper/server_scripts/streaming_codes

python3 server.py

