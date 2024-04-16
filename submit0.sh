#!/bin/bash
#SBATCH --nodes=1
#SBATCH -p dos-chs,a100-4,a100-8
#SBATCH --gres=gpu:a100:1
#SBATCH --mem=100g
#SBATCH --time=24:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=zhan8023@umn.edu

conda activate myenv
module load cuda/12.0
nvidia-smi
bash run.sh > result
