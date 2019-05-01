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


python3 -u polymerization.py ucf101 \
~/data/tsn_paper/server_scripts/weights/RGB/kinetics/Kinetics_BNInception__rgb_model_best.pth.tar ~/data/tsn_paper/server_scripts/weights/RGB_diff/180epoch-3seg-128batch-kinetics_flow/UCF101-3seg_rgbdiff_kinetics_flow_model_best.pth.tar \
--arch BNInception --classInd_file UCF_lists/classInd.txt -j 2 --gpus 0 1 --test_segments 3 --psi 0 --h login01 --test


