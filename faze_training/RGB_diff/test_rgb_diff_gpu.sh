#!/bin/bash



#SBATCH --job-name=test_FAZE_RGB_diff_BNinception_UCF101
#SBATCH --partition=gpu
#SBATCH --gres=gpu:2
#SBATCH --time=14:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=2
#SBATCH --account=g.alex039

source ~/data/anaconda3/bin/activate
module load CUDA

cd ~/data/tsn_paper/real-time-action-recognition/

echo "Start Testing ..................................."

python3 -u  test_models.py ucf101 RGBDiff ~/data/tsn_paper/datasets/rgb_test_FileList1.txt ~/data/tsn_paper/server_scripts/faze_training/RGB_diff/results/180-epoch-3-seg/_rgbdiff_checkpoint.pth.tar \
   --arch  BNInception \
   --classInd_file UCF_lists/classInd.txt \
   --save_scores ~/data/tsn_paper/server_scripts/faze_training/RGB_diff/scores_RGBdiff_BNinception \
   --gpus 0 1 -j 2



echo "End of Testing ................................."

