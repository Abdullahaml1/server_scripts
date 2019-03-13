#!/bin/bash



#SBATCH --job-name=test_FAZE_RGB_kinetics_UCF101
#SBATCH --partition=gpu
#SBATCH --gres=gpu:2
#SBATCH --time=14:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=2

source ~/data/anaconda3/bin/activate
module load CUDA

cd ~/data/tsn_paper/server_scripts/real-time-action-recognition/

echo "Start Testing ..................................."

python3 -u test_models.py ucf101 RGB /home/alex039u2/data/tsn_paper/datasets/rgb_test_FileList1.txt /home/alex039u2/data/tsn_paper/server_scripts/faze_training/RGB/kinetics/Kinetics_BNInception__rgb_model_best.pth.tar \
        --arch BNInception --save_scores /home/alex039u2/data/tsn_paper/server_scripts/faze_training/RGB/kinetics_rgb \
        --classInd_file UCF_lists/classInd.txt \
	--gpus 0 1 -j 2	



echo "End of Testing ................................."
