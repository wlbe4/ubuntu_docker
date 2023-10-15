#!/bin/bash
source names.sh
DOCKER_HOSTNAME=$DOCKER_NAME
CURR_UID=`id -u`
CURR_GID=`id -g`
export TZ=$(readlink /etc/localtime | sed 's#/var/db/timezone/zoneinfo/##');
echo This Docker runs a VNC Server.
echo VNC port 15901 is forwarded into port 5901 \(i.e. display 1\)
echo Open your VNC client with $HOSTNAME:15901
echo SSH connection is also possible by:
echo ssh $USER@$HOSTNAME -p 10022
docker run --hostname $DOCKER_HOSTNAME  -e "TZ=${TZ}" \
                                        --device /dev/nvme0n1 \
                                        --device /dev/nvme1n1 \
                                        -v /etc/timezone:/etc/timezone:ro \
                                        -v /home/$USER:/home/$USER/hosthome \
                                        -v /mnt/SW:/mnt/SW \
                                        -p 10022:22 \
                                        -p 15901:5901 \
                                        -it $DOCKER_NAME $CURR_UID $CURR_GID $USER
