#!/bin/bash
# current uid and gid
source names.sh
mkdir -p docker_config/tmp
cp ~/.bashrc    docker_config/tmp/.
sudo cp /etc/passwd  docker_config/tmp/.
sudo cp /etc/shadow  docker_config/tmp/.
sudo cp /etc/group   docker_config/tmp/.
sudo cp /etc/sudoers docker_config/tmp/.
docker build -f Dockerfile -t ${DOCKER_NAME} .