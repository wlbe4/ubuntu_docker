#!/bin/bash
if [ ! -f "$HOME/.vnc/ubuntu_docker_vnc:1.log" ]; then
    vncserver -depth 24 -geometry 1920x1080
fi

