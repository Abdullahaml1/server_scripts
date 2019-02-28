#!/bin/bash



#SBATCH --job-name=train_FAZE_RGB_diff_BNinception_UCF101
#SBATCH --partition=gpu16
#SBATCH --gres=gpu:1
#SBATCH --time=14:00:00
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks=16

source /lfs01/workdirs/alex039/alex039u2/anaconda3/bin/activate
export LD_PRELOAD="/lfs01/workdirs/alex039/alex039u2/anaconda3/glibc-2.14/lib/libc.so.6"
export OPENBLAS_MAIN_FREE=1

module load CUDA/8.0.61

cd /lfs01/workdirs/alex039/alex039u2/tsn_paper/server_scripts/real-time-action-recognition/

echo "Start Training ..................................."

python3 -u main.py ucf101 RGBDiff /lfs01/workdirs/alex039/alex039u2/tsn_paper/datasets/rgb_train_FileList1.txt /lfs01/workdirs/alex039/alex039u2/tsn_paper/datasets/rgb_test_FileList1.txt \
   --arch  BNInception --num_segments 3 \
   --gd 40 --lr 0.001 --lr_steps 80 160 --epochs 60\
   -b 32 -j 16 --dropout 0.8 \
   --gpus 0  --snapshot_pref /lfs01/workdirs/alex039/alex039u2/tsn_paper/server_scripts/faze_training/RGB_diff/test1_ucf101 



echo "End of Training ................................."
