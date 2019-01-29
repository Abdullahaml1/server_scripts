"""
Downloading raisnet101, inception_v3 architecture models
link: https://pytorch.org/docs/stable/torchvision/models.html
"""




import torch
import torchvision
import os


os.environ['TORCH_MODEL_ZOO'] = "/home/alex039u2/data" #changing pytorch download path

base_model = getattr(torchvision.models, 'resnet101')(True)  #downloading thee model

print(base_model)

base_model = getattr(torchvision.models, 'inception_v3')(True)  #downloading thee model

print(base_model)


