# Modify 'test1.jpg' and 'test2.jpg' to the images you want to predict on

from keras.models import load_model
from keras.preprocessing import image
import numpy as np
import os
from os import listdir
from os.path import isfile, join
execution_path = os.getcwd()

# dimensions of our images
img_width, img_height = 150, 150

admin_list =  []
not_admin = []
# load the model we saved
model = load_model('k3/')
model.compile(optimizer='adam',loss='binary_crossentropy',metrics=['accuracy'])


onlyfiles = [f for f in listdir("data/train/admin/") if isfile(join("data/train/admin/", f))]
for file in onlyfiles:
    # predicting images
    img = image.load_img(f"data/train/admin/{file}", target_size=(img_width, img_height))
    x = image.img_to_array(img)
    x = np.expand_dims(x, axis=0)

    images = np.vstack([x])
    classes = model.predict_classes(images, batch_size=10)

# print the classes, the images belong to
    if classes[0][0] == 0:
        print(f"{file} - This is an admin")
        admin_list.append(file)
    elif classes[0][0] == 1:
        not_admin.append(file)
        print(f"{file} -THIS AINT AN ADMIN")


print(len(admin_list))
print(len(not_admin))