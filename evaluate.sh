#!/bin/bash


if [ $# -ne 1 ]; then
    echo "Usage: $0 path_to_test_directory"
    exit 1
fi

# Get the test directory path from the argument
test_dir="$1"
script_dir="$(dirname "$0")" 
model_path="$script_dir/forest_fire_classifier.h5"  # model file should be in the same directory as the script

#output directory will be in same directory as of the script
output_dir="$(dirname "$0")"

# Check if the test directory exists
if [ ! -d "$test_dir" ]; then
    echo "Error: Test directory not found: $test_dir"
    exit 1
fi

python_script="
import os
import numpy as np
from tensorflow.keras.models import load_model
from tensorflow.keras.preprocessing.image import load_img, img_to_array

# Load the model
model = load_model('$model_path')

# Get list of test image files
test_image_files = os.listdir('$test_dir')
test_image_files.sort()  # Sort for consistent order

# Load and preprocess test images
test_images = []
for img_file in test_image_files:
    img_path = os.path.join('$test_dir', img_file)
    img = load_img(img_path, target_size=(250, 250))
    img_array = img_to_array(img) / 255.0
    test_images.append(img_array)

test_images = np.array(test_images)

# Make predictions
test_predictions = model.predict(test_images)

# Write predictions to outputs.txt
output_file_path = os.path.join('$output_dir', 'outputs.txt')
with open(output_file_path, 'w') as f:
    for i, prediction in enumerate(test_predictions):
        img_file = test_image_files[i]
        predicted_label = 'Non-Fire' if prediction > 0.5 else 'Fire'
        confidence = prediction[0] if predicted_label == 'Non-Fire' else 1 - prediction[0]
        f.write('Test Image {}: Predicted Label: {}, Confidence: {:.2f}\\n'.format(img_file, predicted_label, confidence))
"


echo "$python_script" > evaluate_classifier.py


echo "Running the Python script..."
python3 evaluate_classifier.py


echo "Script execution completed."
