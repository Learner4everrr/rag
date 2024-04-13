#!/bin/bash



python 0_get_train_embedding.py --trainfile dataset/ade/train.json --triever facebook/contriever
wait

python 1_get_train_instruction.py --trainfile dataset/ade/train.json --triever facebook/contriever
wait

python 2_get_test_instruction.py --trainfile dataset/ade/train.json --triever facebook/contriever --testfile dataset/ade/test.json
wait

python 3_train.py --model meta-llama/Llama-2-13b-hf
wait

python 4_generation.py --number 1000
python 5_metrics.py --number 1000
wait

python 4_generation.py --number 2000
python 5_metrics.py --number 2000
wait

python 4_generation.py --number 3000
python 5_metrics.py --number 3000
wait

python 4_generation.py --number 4000
python 5_metrics.py --number 4000
wait

python 4_generation.py --number 5000
python 5_metrics.py --number 5000
wait