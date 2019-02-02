#!/bin/bash



#SBATCH --job-name=test_PAPER_RGB_resnet18
#SBATCH --partition=gpu
#SBATCH --gres=gpu:2
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=2

source ~/data/anaconda3/bin/activate
export LD_PRELOAD="/home/alex039u2/data/anaconda3/glibc-2.14/lib/libc.so.6"
module load CUDA/8.0.61

cd ~/data/tsn_paper/server_scripts/faze_tsn_pytorch

echo "Start Training ..................................."

python3 test_models.py ucf101 RGB /home/alex039u2/data/tsn_paper/datasets/rgb_test_FileList1.txt ucf101_resnet101__rgb_checkpoint.pth \
   --arch resnet18 --save_scores /home/alex039u2/data/tsn_paper/server_scripts/paper_testing/testing_paper_resnet18_results


echo "End of Testing....................................."
