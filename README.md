# discord-image-recognition

## Purpose
The purpose of this project is to train an ML model to classify images of Discord users [in the official Golem Discord](https://chat.golem.network) and check if they use the same image as one of the admins.
There's a lot of scammers in the blockchain space and we would like to eliminate the chance of a user getting scammed in our Discord. To do that we have several mechanisms but monitoring
profile pictures would increase the amount of scammers we can catch significantly due to them often impersonating an admin and contacting users privately.


# Installation
A docker image is in the repository that contains all the things needed to run the example. You just need to have a NVIDIA GPU available.
Please also download the "cuda" directory [here](https://drive.google.com/file/d/1JdvsELk8LmNgia52S06rPOFpfCZatpFv/view?usp=sharing) and place it in the root directory of the project. The dockerfile copies that directory into the container.
