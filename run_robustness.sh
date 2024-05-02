#!/bin/bash

#python 0_get_train_embedding.py --trainfile dataset/ade/noise_robustness/train_20.json --triever facebook/contriever
#python 7_get_instruction.py --indexfile dataset/ade/noise_robustness/train_20.json --file dataset/ade/train.json --triever facebook/contriever
#python 7_get_instruction.py --indexfile dataset/ade/noise_robustness/train_20.json --file dataset/ade/test.json --triever facebook/contriever


#python 0_get_train_embedding.py --trainfile dataset/ade/noise_robustness/train_80.json --triever facebook/contriever
#python 7_get_instruction.py --indexfile dataset/ade/noise_robustness/train_80.json --file dataset/ade/train.json --triever facebook/contriever
#python 7_get_instruction.py --indexfile dataset/ade/noise_robustness/train_80.json --file dataset/ade/test.json --triever facebook/contriever


#python 0_get_train_embedding.py --trainfile dataset/2_chemprot/noise_robustness/train_20.json --triever facebook/contriever
#python 7_get_instruction.py --indexfile dataset/2_chemprot/noise_robustness/train_20.json --file dataset/2_chemprot/train.json --triever facebook/contriever
#python 7_get_instruction.py --indexfile dataset/2_chemprot/noise_robustness/train_20.json --file dataset/2_chemprot/test.json --triever facebook/contriever

#python 0_get_train_embedding.py --trainfile dataset/2_chemprot/noise_robustness/train_80.json --triever facebook/contriever
#python 7_get_instruction.py --indexfile dataset/2_chemprot/noise_robustness/train_80.json --file dataset/2_chemprot/train.json --triever facebook/contriever
#python 7_get_instruction.py --indexfile dataset/2_chemprot/noise_robustness/train_80.json --file dataset/2_chemprot/test.json --triever facebook/contriever

#python 0_get_train_embedding.py --trainfile dataset/0_GM-CIHT/noise_robustness/train_20.json --triever ncbi/MedCPT-Query-Encoder
#python 7_get_instruction.py --indexfile dataset/0_GM-CIHT/noise_robustness/train_20.json --file dataset/0_GM-CIHT/train.json --triever ncbi/MedCPT-Query-Encoder
#python 7_get_instruction.py --indexfile dataset/0_GM-CIHT/noise_robustness/train_20.json --file dataset/0_GM-CIHT/test.json --triever ncbi/MedCPT-Query-Encoder

#python 0_get_train_embedding.py --trainfile dataset/0_GM-CIHT/noise_robustness/train_80.json --triever ncbi/MedCPT-Query-Encoder
#python 7_get_instruction.py --indexfile dataset/0_GM-CIHT/noise_robustness/train_80.json --file dataset/0_GM-CIHT/train.json --triever ncbi/MedCPT-Query-Encoder
#python 7_get_instruction.py --indexfile dataset/0_GM-CIHT/noise_robustness/train_80.json --file dataset/0_GM-CIHT/test.json --triever ncbi/MedCPT-Query-Encoder
wait


#python 3_train.py --model chaoyi-wu/MedLLaMA_13B
#python 3_train.py --model meta-llama/Llama-2-13b-hf
#python 3_train.py --model meta-llama/Meta-Llama-3-8B-Instruct
wait

#python 4_generation.py --model chaoyi-wu/MedLLaMA_13B --number 1000
#python 4_generation.py --model meta-llama/Llama-2-13b-hf --number 1000
#python 4_generation.py --model meta-llama/Meta-Llama-3-8B-Instruct --number 1000
python 5_metrics.py --number 1000
wait

#python 4_generation.py --model chaoyi-wu/MedLLaMA_13B --number 2000
#python 4_generation.py --model meta-llama/Llama-2-13b-hf --number 2000
#python 4_generation.py --model meta-llama/Meta-Llama-3-8B-Instruct --number 2000
python 5_metrics.py --number 2000
wait

#python 4_generation.py --model chaoyi-wu/MedLLaMA_13B --number 3000
#python 4_generation.py --model meta-llama/Llama-2-13b-hf --number 3000
#python 4_generation.py --model meta-llama/Meta-Llama-3-8B-Instruct --number 3000
python 5_metrics.py --number 3000
wait

#python 4_generation.py --model chaoyi-wu/MedLLaMA_13B --number 4000
#python 4_generation.py --model meta-llama/Llama-2-13b-hf --number 4000
#python 4_generation.py --model meta-llama/Meta-Llama-3-8B-Instruct --number 4000
python 5_metrics.py --number 4000
wait

#python 4_generation.py --model chaoyi-wu/MedLLaMA_13B --number 5000
#python 4_generation.py --model meta-llama/Llama-2-13b-hf --number 5000
#python 4_generation.py --model meta-llama/Meta-Llama-3-8B-Instruct --number 5000
python 5_metrics.py --number 5000
wait