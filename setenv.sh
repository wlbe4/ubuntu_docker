#!/bin/bash
USER_UID=$1
USER_GID=$2
USER_NAME=$3
groupadd -g $USER_GID -o $USER_NAME &>/dev/null
useradd -m -u $USER_UID -g $USER_GID -o -s /bin/bash $USER_NAME &>/dev/null
echo "$USER_NAME:$USER_NAME" | chpasswd
adduser $USER_NAME sudo &>/dev/null
## Create $USER_NAME user with sudo privileges
usermod -aG sudo $USER_NAME &>/dev/null
## New added for disable sudo password
echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
cd /home/$USER_NAME
su $USER_NAME
