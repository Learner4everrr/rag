#!/bin/bash

python 6_bm25.py --trainfile dataset/ade/train.json --testfile dataset/ade/test.json --train True
wait
python 6_bm25.py --trainfile dataset/ade/train.json --testfile dataset/ade/test.json --train False
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
