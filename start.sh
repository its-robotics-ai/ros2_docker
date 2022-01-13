#!/usr/bin/env bash


# https://github.com/dusty-nv/jetson-containers

CONTAINER_IMAGE="preice/nw_ros2_init:0.3"

USER_VOLUME=""
USER_COMMAND=""


# give docker root user X11 permissions
sudo xhost +si:localuser:root

# enable SSH X11 forwarding inside container (https://stackoverflow.com/q/48235040)
XAUTH=/tmp/.docker.xauth
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
chmod 777 $XAUTH

# run the container
sudo docker run --runtime nvidia -it --rm --network host -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix/:/tmp/.X11-unix \
    -v $XAUTH:$XAUTH -e XAUTHORITY=$XAUTH \
    $USER_VOLUME $CONTAINER_IMAGE $USER_COMMAND