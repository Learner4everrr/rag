import torch
import json
from transformers import AutoTokenizer, AutoModel
import numpy as np


sentences=[]
with open("dataset/1_DDI/train_triples.json") as fr:
    for line in fr.readlines():
        line=json.loads(line.strip())
        for li in line:
            if li["triple_list"][0][1]!="None":
                sentences.append("context: "+li["text"] + "response: "+ "|".join(li["triple_list"][0]))


tokenizer = AutoTokenizer.from_pretrained('facebook/contriever')
model = AutoModel.from_pretrained('facebook/contriever')


# Apply tokenizer
inputs = tokenizer(sentences, padding=True, truncation=True, return_tensors='pt')

# Compute token embeddings
# outputs = model(**inputs)


# Mean pooling
# Apply tokenizer
def mean_pooling(token_embeddings, mask):
    token_embeddings = token_embeddings.masked_fill(~mask[..., None].bool(), 0.)
    sentence_embeddings = token_embeddings.sum(dim=1) / mask.sum(dim=1)[..., None]
    return sentence_embeddings



all_sentence_vector=[]
l=-1
for sentence in sentences:
    l=l+1
    print(l)
    inputs = tokenizer(sentence, padding=True, truncation=True, return_tensors='pt')
    # Compute token embeddings
    outputs = model(**inputs)
    # Mean pooling
    embeddings = mean_pooling(outputs[0], inputs['attention_mask'])
    np_embedding=embeddings.detach().numpy()[0]
    all_sentence_vector.append(np_embedding)


np.save("train_embedding_DDI.npy", all_sentence_vector)
