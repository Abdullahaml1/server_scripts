#!/bin/bash



#SBATCH --job-name=test_FAZE_RGB_raisnet18_UCF101
#SBATCH --partition=gpu
#SBATCH --gres=gpu:2
#SBATCH --time=14:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=2

source ~/data/anaconda3/bin/activate
export LD_PRELOAD="/home/alex039u2/data/anaconda3/glibc-2.14/lib/libc.so.6"
module load CUDA/8.0.61

cd ~/data/tsn_paper/server_scripts/real-time-action-recognition/

echo "Start Testing ..................................."

python3 test_models.py ucf101 RGB /home/alex039u2/data/tsn_paper/datasets/rgb_test_FileList1.txt /home/alex039u2/data/tsn_paper/server_scripts/faze_training/RGB/bninception_results/slurm-223040/ucf101_bninception_128__rgb_checkpoint.pth.tar \
        --arch BNInception --save_scores /home/alex039u2/data/tsn_paper/server_scripts/faze_training/RGB/bninception_results/slurm-223040/scores_RGB_BNinception_ \
	--gpus 0 1 -j 2	



echo "End of Testing ................................."
