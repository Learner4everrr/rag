from transformers import AutoTokenizer, AutoModel
from transformers import LlamaTokenizer, LlamaForCausalLM


def model_creater(model_name):
	if model_name in ['meta-llama/Llama-2-13b-hf', 'medalpaca/medalpaca-13b', 'ncbi/MedCPT-Query-Encoder', 'facebook/contriever',\
						'meta-llama/Meta-Llama-3-8B-Instruct']:
		tokenizer = AutoTokenizer.from_pretrained(model_name)
		model = AutoModel.from_pretrained(model_name)
	elif model_name in ['chaoyi-wu/MedLLaMA_13B']:
		tokenizer = LlamaTokenizer.from_pretrained(model_name)
		model = LlamaForCausalLM.from_pretrained(model_name)


	return tokenizer, model