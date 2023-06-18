FROM nvidia/cuda:11.1.1-cudnn8-runtime-ubuntu18.04

# set a directory for uflow
WORKDIR /home/uflow

# copy uflow to the container
COPY . .

# install dependencies and emacs
RUN apt update && apt install -y --no-install-recommends emacs python3 python3-pip libgl1-mesa-glx unzip

# upgrade pip
RUN /usr/bin/python3 -m pip install --upgrade pip

# workaround to avoid pip install getting stuck
RUN pip install setuptools wheel opencv-python==4.5.3.56

# install uflow dependencies
RUN pip install --no-cache-dir -r requirements.txt

