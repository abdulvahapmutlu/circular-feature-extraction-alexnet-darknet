# Circular Deep Feature Extraction using Pretrained AlexNet and Circular DarkNet53

This repository contains MATLAB code for extracting circular deep features from images using pretrained AlexNet and Circular DarkNet53 models. These extracted features are then processed and selected using advanced statistical methods for subsequent classification tasks.

## Description
The provided codes implement a circular deep feature extraction method leveraging two powerful convolutional neural networks:

AlexNet-based Feature Extraction:

The code uses a pretrained AlexNet model to extract features from images.
Images are resized and equalized before being processed.
Circular regions around the image center are extracted at varying radii to capture local features.
Features are extracted from three layers: fc6, fc7, and fc8.
The extracted features are normalized and feature selection is performed using fscnca and relieff.
DarkNet53-based Feature Extraction:

The code uses a pretrained Circular DarkNet53 model to extract features.
Similar to the AlexNet code, images are resized and equalized.
Circular regions around the image center are extracted at varying radii.
Features are extracted from the conv53 layer.
The extracted features are normalized and feature selection is performed using fscnca and relieff.
## Getting Started
### Prerequisites
MATLAB R2018b or later
Deep Learning Toolbox
Pretrained AlexNet and DarkNet53 models
### Instructions
AlexNet-based Feature Extraction:

Run Circular_AlexNet.m to extract and save the features.
The script processes images in the current directory with extensions *.*g.
DarkNet53-based Feature Extraction:

Run CircularDarkNet53.m to extract and save the features.
The script processes images in the current directory with extensions *.*p.

## Files
Circular_AlexNet.m: MATLAB code for feature extraction using AlexNet.
CircularDarkNet53.m: MATLAB code for feature extraction using Circular DarkNet53.
