#!/bin/bash

# GUI 권한 허용
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
  --name my_autoware \
  my_autoware:ddr

