# from datasets import load_dataset
import torch
import transformers
from peft import LoraConfig
from transformers import AutoModelForCausalLM, BitsAndBytesConfig, AutoTokenizer
from transformers import LlamaTokenizer
from trl import SFTTrainer
from datasets import load_dataset

print("1"*50)


def formatting_func(example):
  if example.get("context", "") != "":
      input_prompt = (f"Below is an instruction that describes a task, paired with an input that provides further context. "
      "Write a response that appropriately completes the request.\n\n"
      "### Instruction:\n"
      f"{example['instruction']}\n\n"
      f"### Input: \n"
      f"{example['context']}\n\n"
      f"### Response: \n"
      f"{example['response']}")

  else:
    input_prompt = (f"Below is an instruction that describes a task. "
      "Write a response that appropriately completes the request.\n\n"
      "### Instruction:\n"
      f"{example['instruction']}\n\n"
      f"### Response:\n"
      f"{example['response']}")

  return {"text" : input_prompt}

def prepare_data(path):
    data = load_dataset("json", data_files=path)
    formatted_data = data.map(formatting_func)
    print( formatted_data["train"])
    return formatted_data["train"]


# formatted_dataset = dbricks_15k_dataset_prepared.map(formatting_func)


train_path="DDI_train_instruction_container.json"
test_path="DDI_test_instruction_container.json"
# test_path="test_chuck_instruction_5_llama13b_right.json"

train = prepare_data(train_path)
# test = prepare_data(test_path)

# print(train["train"][2]["text"])
print("2"*50)

# print(train[5])
# print()
# print(test[5])



# # # model_id = '/scratch/ahcie-gpu2/openllama-models/MedLLaMA_13B'
# # model_id="/scratch/ahcie-gpu2/llama-models-meta-hf/Llama-2-13b-hf"
model_id = "meta-llama/Llama-2-13b-hf"
# model_id = "medalpaca/medalpaca-13b"

qlora_config = LoraConfig(
    r=64,
    lora_alpha=32,
    lora_dropout=0.1,
    bias="none",
    task_type="CAUSAL_LM"
)

bnb_config = BitsAndBytesConfig(
    load_in_4bit=True,
    bnb_4bit_use_double_quant=True,
    bnb_4bit_quant_type="nf4",
    bnb_4bit_compute_dtype=torch.bfloat16
)

base_model = AutoModelForCausalLM.from_pretrained(
    model_id,
    quantization_config=bnb_config,torch_dtype=torch.float16, device_map='auto',
)

print("3"*50)


tokenizer = AutoTokenizer.from_pretrained(model_id)
tokenizer.add_special_tokens({'pad_token': '[PAD]'})
# tokenizer.add_special_tokens({'end_token': '[END]'})

print("4"*50)

supervised_finetuning_trainer = SFTTrainer(
    base_model,
    train_dataset=train,
    eval_dataset=test,
    args=transformers.TrainingArguments(
        per_device_train_batch_size=1,
        gradient_accumulation_steps=4,
        learning_rate=2e-4,
        max_steps=5000,
        max_grad_norm=0.3,
        warmup_ratio=0.03,
        output_dir="Our_model",
        optim="paged_adamw_8bit",
        fp16=True,
        evaluation_strategy = "steps",
        eval_steps = 50,
        save_steps = 50,
        load_best_model_at_end=True,
        save_strategy='steps',
    ),
    tokenizer=tokenizer,
    peft_config=qlora_config,
    dataset_text_field="text",
    max_seq_length=2048  #4098
)

supervised_finetuning_trainer.train()