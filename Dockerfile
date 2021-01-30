# https://towardsdatascience.com/object-detection-with-10-lines-of-code-d6cb4d86f606
FROM python:3.7.6
FROM nvidia/cuda:11.0.3-runtime-ubuntu18.04
RUN apt-get update && apt-get install -y \
    software-properties-common
RUN add-apt-repository universe
RUN apt-get install -y \
    python3.7 \
    python3-pip
RUN pip3 install --upgrade pip setuptools
RUN pip3 install tensorflow-gpu==2.4.0 keras==2.4.3 numpy==1.19.3 pillow==7.0.0 scipy==1.4.1 h5py==2.10.0 matplotlib==3.3.2 opencv-python keras-resnet==0.2.0
WORKDIR /imageai/
COPY . /imageai/
RUN mkdir /usr/local/nvidia/
RUN mkdir /usr/local/nvidia/include/
RUN mkdir /usr/local/nvidia/lib64/
RUN cp cuda/include/cudnn.h /usr/local/nvidia/include/
RUN cp cuda/lib64/libcudnn* /usr/local/nvidia/lib64/
RUN chmod a+r /usr/local/nvidia/include/cudnn.h /usr/local/nvidia/lib64/libcudnn*
RUN pip3 install imageai
