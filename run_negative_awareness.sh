#!/bin/bash

#python 0_get_train_embedding.py --trainfile dataset/ade/noise_robustness/train_100.json --triever facebook/contriever
#python 7_get_instruction.py --indexfile dataset/ade/noise_robustness/train_100.json --file dataset/ade/test.json --triever facebook/contriever --instruction instruction/instruction_adena.txt


#python 0_get_train_embedding.py --trainfile dataset/2_chemprot/noise_robustness/train_100.json --triever facebook/contriever
#python 7_get_instruction.py --indexfile dataset/2_chemprot/noise_robustness/train_100.json --file dataset/2_chemprot/test.json --triever facebook/contriever --instruction instruction/instruction_chemprotna.txt


#python 0_get_train_embedding.py --trainfile dataset/0_GM-CIHT/noise_robustness/train_100.json --triever ncbi/MedCPT-Query-Encoder
#python 7_get_instruction.py --indexfile dataset/0_GM-CIHT/noise_robustness/train_100.json --file dataset/0_GM-CIHT/test.json --triever ncbi/MedCPT-Query-Encoder --instruction instruction/instruction_gmcihtna.txt
wait


#python 4_generation.py --model chaoyi-wu/MedLLaMA_13B --number 1000
#python 4_generation.py --model meta-llama/Llama-2-13b-hf --number 1000
#python 4_generation.py --model meta-llama/Meta-Llama-3-8B-Instruct --number 1000
wait

python 9_metrics_reject_rate.py --number 1000

#python 10_generation_truefalse.py --model chaoyi-wu/MedLLaMA_13B --number 1000 --file true_noise.json
#python 10_generation_truefalse.py --model meta-llama/Llama-2-13b-hf --number 1000 --file true_noise.json
#python 10_generation_truefalse.py --model meta-llama/Meta-Llama-3-8B-Instruct --number 1000 --file true_noise.json
wait

#python 10_generation_truefalse.py --model chaoyi-wu/MedLLaMA_13B --number 1000 --file fake_noise.json
#python 10_generation_truefalse.py --model meta-llama/Llama-2-13b-hf --number 1000 --file fake_noise.json
#python 10_generation_truefalse.py --model meta-llama/Meta-Llama-3-8B-Instruct --number 1000 --file fake_noise.json

python 11_metric_na_rate.py
wait