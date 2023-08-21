# Forrest Fire Detection
This repository contains code for a simple image classification task that classifies forest images into two categories: "Forest Fire" and "Non Forest Fire". A Convolutional Neural Network (CNN) model is used for this classification task. The code is implemented using TensorFlow and can be run on Google Colab.

**Dataset**

The dataset used for this project is available in the "Dataset.zip" file. It contains two folders: "Training" and "Testing". The "Training"  contains subfolders "fire" and "no_fire", each containing respective images. The "Testing" subdirectory directly contains test images.

**Setup**

Clone this repository to your local machine or download the ZIP file.

Extract the contents of "Dataset.zip" into the repository directory. << i am not providing this in this repository right now

Upload the entire repository (and dataset) to your Google Drive.

**Usage**

The Forest_Fire_Detection.ipynb notebook provides step-by-step instructions on data preprocessing, model building, training, and evaluation. You can run this notebook on Google Colab.


# Forest Fire Classifier Evaluation Script

This repository contains a Bash script that allows you to evaluate the performance of your forest fire classifier on a test dataset. The script runs a Python program that uses a trained model to predict whether images in the test dataset contain forest fire or not.

## Usage

1. Make sure you have the necessary requirements installed, including TensorFlow and any other dependencies. If not, you can install them using:

   ```bash
   pip3 install tensorflow


   chmod +x evaluate.sh
 
   
   /evaluate.sh /dataset


Replace /dataset with the actual path to your test dataset. **The script will assume that the model file (forest_fire_classifier.h5) is located in the same directory as the evaluate.sh script.**

The script will run the evaluation and generate an outputs.txt file in the same directory as the script. This file will contain the predicted labels and confidence scores for each test image.
