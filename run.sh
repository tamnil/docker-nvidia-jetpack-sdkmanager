#!/bin/bash

#xhost +local:$USER
docker run -it \
    --name=jetpack-sdk \
    --rm=true \
    --net=host \
    --ipc host\
    --privileged \
    --volume="/dev/bus/usb:/dev/bus/usb" \
    --volume="/home/$USER/docker-jetpack-sdk/jetson/Downloads:/home/user/Downloads" \
    --volume="/home/$USER/docker-jetpack-sdk/jetson/nvidia:/home/user/nvidia" \
    --volume="/home/$USER/docker-jetpack-sdk/jetson/dot-nvsdkm:/home/user/.nvsdkm" \
    --user "$(id -u):$(id -g)" \
    --env="DISPLAY=$DISPLAY" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    jetpack-sdk /bin/bash
