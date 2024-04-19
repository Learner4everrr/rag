#!/bin/bash

#python 6_bm25.py --trainfile dataset/ade/train.json --testfile dataset/ade/test.json --train
#wait
#python 6_bm25.py --trainfile dataset/ade/train.json --testfile dataset/ade/test.json
#wait


#python 0_get_train_embedding.py --trainfile dataset/ade/train.json --triever ncbi/MedCPT-Query-Encoder
#python 0_get_train_embedding.py --trainfile dataset/ade/train.json --triever facebook/contriever
wait

#python 1_get_train_instruction.py --trainfile dataset/ade/train.json --triever ncbi/MedCPT-Query-Encoder
#python 1_get_train_instruction.py --trainfile dataset/ade/train.json --triever facebook/contriever
wait

#python 2_get_test_instruction.py --trainfile dataset/ade/train.json --testfile dataset/ade/test.json --triever ncbi/MedCPT-Query-Encoder
#python 2_get_test_instruction.py --trainfile dataset/ade/train.json --testfile dataset/ade/test.json --triever facebook/contriever
wait

#python 3_train.py --model meta-llama/Llama-2-13b-hf
#python 3_train.py --model chaoyi-wu/MedLLaMA_13B
#python 3_train.py --model medalpaca/medalpaca-13b
python 3_train.py --model meta-llama/Meta-Llama-3-8B-Instruct
wait

#python 4_generation.py --model chaoyi-wu/MedLLaMA_13B --number 1000
#python 4_generation.py --model medalpaca/medalpaca-13b --number 1000
python 4_generation.py --model meta-llama/Meta-Llama-3-8B-Instruct --number 1000
python 5_metrics.py --number 1000
wait

#python 4_generation.py --model chaoyi-wu/MedLLaMA_13B --number 2000
#python 4_generation.py --model medalpaca/medalpaca-13b --number 2000
python 4_generation.py --model meta-llama/Meta-Llama-3-8B-Instruct --number 2000
python 5_metrics.py --number 2000
wait

#python 4_generation.py --model chaoyi-wu/MedLLaMA_13B --number 3000
#python 4_generation.py --model medalpaca/medalpaca-13b --number 3000
python 4_generation.py --model meta-llama/Meta-Llama-3-8B-Instruct --number 3000
python 5_metrics.py --number 3000
wait

#python 4_generation.py --model chaoyi-wu/MedLLaMA_13B --number 4000
#python 4_generation.py --model medalpaca/medalpaca-13b --number 4000
python 4_generation.py --model meta-llama/Meta-Llama-3-8B-Instruct --number 4000
python 5_metrics.py --number 4000
wait

#python 4_generation.py --model chaoyi-wu/MedLLaMA_13B --number 5000
#python 4_generation.py --model medalpaca/medalpaca-13b --number 5000
python 4_generation.py --model meta-llama/Meta-Llama-3-8B-Instruct --number 5000
python 5_metrics.py --number 5000
wait
