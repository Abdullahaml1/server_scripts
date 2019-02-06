#!/bin/bash



#SBATCH --job-name=train_FAZE_RGB_raisnet18_UCF101
#SBATCH --partition=gpu
#SBATCH --gres=gpu:2
#SBATCH --time=14:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=2

source ~/data/anaconda3/bin/activate
export LD_PRELOAD="/home/alex039u2/data/anaconda3/glibc-2.14/lib/libc.so.6"
module load CUDA/8.0.61

cd ~/data/tsn_paper/server_scripts/real-time-action-recognition/

echo "Start Training ..................................."

python3 main.py ucf101 RGB /home/alex039u2/data/tsn_paper/datasets/rgb_train_FileList1.txt /home/alex039u2/data/tsn_paper/datasets/rgb_test_FileList1.txt \
   --arch resnet18 --num_segments 3 \
   --gd 20 --lr 0.001 --lr_steps 30 60 --epochs 60 \
   -b 256 -j 2 --dropout 0.8 \
   --gpus 0 1 --snapshot_pref /home/alex039u2/data/tsn_paper/server_scripts/faze_training/ucf101_resnet18_256_



echo "End of Training ................................."
