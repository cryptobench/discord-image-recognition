import tensorflow as tf
import numpy as np
from tensorflow import keras
import os
import cv2
from tensorflow.keras.preprocessing.image import ImageDataGenerator
from tensorflow.keras.preprocessing import image
import matplotlib.pyplot as plt
from tensorflow.keras.models import Sequential, save_model, load_model



train = ImageDataGenerator(rescale=1/255)
test = ImageDataGenerator(rescale=1/255)

checkpoint_path = "k3/"

# Create a callback that saves the model's weights
cp_callback = tf.keras.callbacks.ModelCheckpoint(filepath=checkpoint_path,
                                                 save_weights_only=False,
                                                 verbose=1)

train_dataset = train.flow_from_directory("data/train/",
                                          target_size=(150,150),
                                          batch_size = 32,
                                          class_mode = 'binary')
                                         
test_dataset = test.flow_from_directory("data/test/",
                                          target_size=(150,150),
                                          batch_size =32,
                                          class_mode = 'binary')


model = load_model("k3/")


model.fit_generator(train_dataset,
         steps_per_epoch = 250,
         epochs = 15,
         validation_data = test_dataset,
        callbacks=[cp_callback]
         )

save_model(model, "models/")