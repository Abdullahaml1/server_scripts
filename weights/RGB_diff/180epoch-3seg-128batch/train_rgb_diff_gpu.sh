#!/bin/bash



#SBATCH --job-name=BNinception_UCF101_3seg
#SBATCH --partition=gpu
#SBATCH --gres=gpu:2
#SBATCH --time=60:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=8

source ~/data/anaconda3/bin/activate
module load CUDA

cd ~/data/tsn_paper/server_scripts/real-time-action-recognition/


echo "Start Training ..................................."

python3 -u  main.py ucf101 RGBDiff ~/data/tsn_paper/datasets/rgb_train_FileList1.txt ~/data/tsn_paper/datasets/rgb_test_FileList1.txt \
   --arch  BNInception --num_segments 3 \
   --gd 40 --lr 0.001 --lr_steps 80 160 --epochs 180 \
   -b 128 -j 8 --dropout 0.8 \
   --gpus 0 1 \
   --snapshot_pref ~/data/tsn_paper/server_scripts/faze_training/RGB_diff/UCF101-3seg_BNinception



echo "End of Training ................................."

