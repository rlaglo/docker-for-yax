# Prerequisite
run_autoware.sh is shell script activating docker you pulled from docker pull rlaglo/autoware:ddr

Before you source run_autoware.sh file, you shoud modify some codes according to your personal settings

content of run_autoware.sh is as below

ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ\
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
ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ


# Options
-v options defines volume mount: check your volume mount path, and assign it with docker container's path \
[a]:[b] means a directory [b] in container's space will share same space with host's space [a] \
ex) /my_dir/my_ws:/home/autoware/shared_dir means you can see what you installed in container from host's /my_dir/my_ws folder

deactivating options #17 ~ #21 is recommended \
EX)
ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ\
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
ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

# Run 
at terminal, type

. /<path_to_run_autoware.sh> \
or \
source /<path_to_run_autoware.sh> 


