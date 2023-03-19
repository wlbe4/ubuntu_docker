#!/bin/bash
source names.sh
DOCKER_HOSTNAME=$DOCKER_NAME
CURR_UID=`id -u`
CURR_GID=`id -g`
docker run --hostname $DOCKER_HOSTNAME  -v /projects:/projects \
                                        -v /mnt/SW:/mnt/SW \
                                        -it $DOCKER_NAME $CURR_UID $CURR_GID $USER