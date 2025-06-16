# hand-gesture-detection
Machine Learning &amp; Computer Vision Project

## About
In this report, a functional real time vision based on American sign language recognition for D&M people have been developed for ASL alphabets. We achieved an accuracy of 95.7% on our dataset. 
Prediction has been improved after implementing two layers of algorithms in which we verify and predict symbols which are more similar to each other.

The approach taken is applying image filtering with OpenCV to get the processed image after feature extraction. This processed image is passed to Convolutional Neural Networks (CNN) model for prediction and if a letter is detected for more than 50 frames. We detect various symbols and show similar results via detection. 

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [System Architecture](#system-architecture)
- [Methodology](#methodology)
- [Results](#results)
- [Applications](#applications)
- [License](#license)

## Overview

The objective of this project is to develop a functional real-time ASL recognition system. The approach involves:

- Applying image filtering with OpenCV for feature extraction.
- Utilizing a CNN model for gesture classification.
- Implementing a verification mechanism to enhance prediction accuracy, especially for similar symbols.

## Features

- **Real-Time Detection**: Processes video input to recognize hand gestures instantaneously.
- **High Accuracy**: Achieved an accuracy of 95.7% on the custom dataset.
- **Verification Mechanism**: Employs a two-layer algorithm to verify and predict symbols that are similar to each other, enhancing reliability.
- **Frame-Based Prediction**: Considers a letter detected only if it appears consistently over 50 frames, reducing false positives.

## System Architecture

The system comprises the following components:

- **Data Acquisition**: Captures hand gesture images using a webcam.
- **Preprocessing**: Applies image filtering techniques using OpenCV to extract relevant features.
- **Model Training**: Trains a CNN model on the processed images for gesture classification.
- **Prediction Verification**: Implements a mechanism to verify predictions over multiple frames to ensure consistency.

## Methodology

1. **Data Collection**: Gathered a dataset of ASL alphabet gestures.
2. **Preprocessing**: Applied image filtering to enhance features relevant for classification.
3. **Model Development**: Designed and trained a CNN model tailored for hand gesture recognition.
4. **Verification Algorithm**: Developed a two-layer algorithm to verify predictions, especially for gestures with similar appearances.
5. **Real-Time Implementation**: Integrated the model into a system capable of processing live video input for real-time gesture recognition.

## Results

- **Accuracy**: The system achieved a 95.7% accuracy rate on the custom dataset.
- **Robustness**: The verification mechanism significantly reduced misclassifications, particularly for gestures with similar features.
- **Real-Time Performance**: Successfully implemented real-time gesture recognition with minimal latency.

## Applications

- **Assistive Technology**: Enables communication for individuals with hearing and speech impairments.
- **Human-Computer Interaction**: Facilitates gesture-based control systems.
- **Educational Tools**: Serves as a learning aid for teaching and understanding ASL.

## License

This project is licensed under the [MIT License](LICENSE), allowing for open collaboration and modification.
