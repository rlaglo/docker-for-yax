# Prerequisite

# Docker installation \
```
sudo apt update
sudo apt install -y docker.io
```
# Add current user to docker group (to use docker w/o sudo)
```
sudo usermod -aG docker $USER
log out or reboot to apply effect (later)
```

# NVIDIA Container Toolkit
```
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
```
(check your ros distro if error occurs)
```
sudo apt update
sudo apt install -y nvidia-container-toolkit
```


you shoud first install docker. it is recommended to register at docker.io\
run_autoware.sh is shell script activating docker you pulled from docker pull rlaglo/autoware:ddr\
Before you source run_autoware.sh file, you shoud modify some codes according to your personal settings\
content of run_autoware.sh is as below
```
#!/bin/bash

xhost +local:root

docker run -it --rm \
  --net=host \
  --gpus all \
  --shm-size=8g \
  -e DISPLAY=$DISPLAY \
  -e NVIDIA_VISIBLE_DEVICES=all \
  -e NVIDIA_DRIVER_CAPABILITIES=all \
  -e RMW_IMPLEMENTATION=rmw_cyclonedds_cpp \
  -e CYCLONEDDS_URI=file:///home/autoware/cyclonedds.xml \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /media/qwer123/ubuntu1/autoware_data:/home/autoware/shared_dir \
  -v /media/qwer123/bigg1/ubuntufile:/home/autoware/shared_dir2 \
  -v /home/qwer123/cyclonedds.xml:/home/autoware/cyclonedds.xml:ro \
  --name autoware \
  autoware:ddr \
```


# Options
-v options defines volume mount: check your volume mount path, and assign it with docker container's path \
[a]:[b] means a directory [b] in container's space will share same space with host's space [a] \
ex) /my_dir/my_ws:/home/autoware/shared_dir means you can see what you installed in container from host's /my_dir/my_ws folder\
deactivating options #17 ~ #21 is recommended \
EX)
```
#!/bin/bash

xhost +local:root

docker run -it --rm \
  --net=host \
  --gpus all \
  --shm-size=8g \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /my_host's somewhere:/home/autoware/shared_dir \
  --name autoware \
  autoware:ddr \
```

# Run 
at terminal, type
```
. /<path_to_run_autoware.sh>
```
or
```
source /<path_to_run_autoware.sh> 
```

