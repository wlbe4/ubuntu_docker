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
chown $USER_NAME:$USER_NAME /home/$USER_NAME
cd /home/$USER_NAME
cp /docker_config/tmp/.bashrc .bashrc
echo $'\n' >> .bashrc
echo source /home/${USER_NAME}/.vnc/run_server.sh >> .bashrc
chown $USER_NAME:$USER_NAME /home/$USER_NAME/.bashrc

cp -r /docker_config/vnc        /home/$USER_NAME/.vnc
chown $USER_NAME:$USER_NAME -R  /home/$USER_NAME/.vnc
mkdir -p /home/$USER_NAME/.config
cp -r /docker_config/xfce4      /home/$USER_NAME/.config/xfce4
chown $USER_NAME:$USER_NAME -R  /home/$USER_NAME/.config/xfce4
# Copy user passwords from host:
cp /docker_config/tmp/passwd    /etc/passwd
cp /docker_config/tmp/shadow    /etc/shadow
cp /docker_config/tmp/group     /etc/group
cp /docker_config/tmp/sudoers   /etc/sudoers

# Start SSH server
/usr/sbin/sshd -D &
su $USER_NAME
