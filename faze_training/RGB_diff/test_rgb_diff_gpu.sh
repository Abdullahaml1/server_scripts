#!/bin/bash



#SBATCH --job-name=test_FAZE_RGB_diff_BNinception_UCF101
#SBATCH --partition=gpu
#SBATCH --gres=gpu:2
#SBATCH --time=14:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=2

source /lfs01/workdirs/alex039/alex039u2/anaconda3/bin/activate
export LD_PRELOAD="/lfs01/workdirs/alex039/alex039u2/anaconda3/glibc-2.14/lib/libc.so.6"
module load CUDA/8.0.61

cd /lfs01/workdirs/alex039/alex039u2/tsn_paper/server_scripts/real-time-action-recognition/

echo "Start Testing ..................................."

python3 -u  test_models.py ucf101 RGBDiff /lfs01/workdirs/alex039/alex039u2/tsn_paper/datasets/rgb_test_FileList1.txt /lfs01/workdirs/alex039/alex039u2/tsn_paper/server_scripts/faze_training/RGB_diff/results/180-epoch-3-seg/_rgbdiff_checkpoint.pth.tar \
   --arch  BNInception \
   --save_scores /lfs01/workdirs/alex039/alex039u2/tsn_paper/server_scripts/faze_training/RGB_diff/scores_RGBdiff_BNinception \
   --gpus 0 1 -j 2



echo "End of Testing ................................."

