#!/bin/bash
#SBATCH --nodes=1
#SBATCH -p a100-4
#SBATCH --gres=gpu:a100:1
#SBATCH --mem=200g
#SBATCH --time=8:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=zhan8023@umn.edu

conda activate myenv
module load cuda/12.0
nvidia-smi
python 0_get_train_embedding_DDI.py > result
