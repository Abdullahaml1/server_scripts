#!/bin/bash



#SBATCH --job-name=train_FAZE_RGB_diff_BNinception_UCF101
#SBATCH --partition=gpu
#SBATCH --gres=gpu:2
#SBATCH --time=14:00:00
#SBATCH --ntasks=16

source ~/data/anaconda3/bin/activate
module load CUDA

cd ~/data/tsn_paper/server_scripts/real-time-action-recognition/


echo "Start Training ..................................."

python3 -u  main.py ucf101 RGBDiff ~/data/tsn_paper/datasets/rgb_train_FileList1.txt ~/data/tsn_paper/datasets/rgb_test_FileList1.txt \
   --arch  BNInception --num_segments 7 \
   --gd 40 --lr 0.001 --lr_steps 80 160 --epochs 180 \
   -b 64 -j 16 --dropout 0.8 \
   --gpus 0 1 --snapshot_pref ~/data/tsn_paper/server_scripts/faze_training/RGB_diff/RGB_diff-ucf101-7seg



echo "End of Training ................................."

