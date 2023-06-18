# How to deploy UFlow

## Get the forked repo

```
git clone git@github.com:jcaballeros/google-research.git
```

## Get the dataset
```
cd google-research/uflow
wget http://files.is.tue.mpg.de/sintel/MPI-Sintel-complete.zip
```

## Create Docker image

```
docker build -t jcaballero/uflow .
```

##  Create container
```
docker run --gpus all --name uflow-container -it jcaballero/uflow bash
```

or to use only one GPU, say GPU 1:

```
docker run --gpus '"device=1"' --name uflow-container -it jcaballero/uflow bash
```

## Restart container in exit status
```
docker start uflow-container
```

## Open bash in the container
```
docker exec -it $(docker ps -a -q --filter "name=uflow-container") bash
```

# Known issues

## unknown flag: --gpus
Run the following command:

```
sudo apt-get install docker-ce-cli docker-ce
```

## docker: Error response from daemon: could not select device driver "" with capabilities: [[gpu]].

Install NVIDIA GPU drivers. On Ubuntu use the Software&Updates UI, then run:
```
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/ubuntu18.04/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
sudo systemctl restart docker
```

## libcudnn8 doesn't match when launching UFlow
Uninstall libcudnn8 with apt and follow the instructions at: https://docs.nvidia.com/deeplearning/cudnn/install-guide/index.html#installlinux-deb