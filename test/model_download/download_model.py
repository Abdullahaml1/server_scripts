import torch 
import torchvision
import os 


os.environ['TORCH_MODEL_ZOO'] = "user-directory-path" #changing pytorch download path

base_model = getattr(torchvision.models, 'resnet101')(True)  #downloading thee model

print(base_model)
