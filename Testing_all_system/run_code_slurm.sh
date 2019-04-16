#!/bin/bash



#SBATCH --job-name=All-system-test
#SBATCH --partition=gpu
#SBATCH --gres=gpu:2
#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=2

source ~/data/anaconda3/bin/activate
module load CUDA

cd ~/data/tsn_paper/real-time-action-recognition/


echo "Starting System  ..................................."


python3 -u polymerization.py ucf101 RGB  ~/data/tsn_paper/server_scripts/faze_training/RGB/bninception_results/slurm-223040/ucf101_bninception_128__rgb_checkpoint.pth.tar \
--arch BNInception --classInd_file UCF_lists/classInd.txt -j 2 --gpus 0 1 --test_segments 5 --psi 9.5

