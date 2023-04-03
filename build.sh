#!/bin/bash
# current uid and gid
source names.sh
cp ~/.bashrc user_bashrc
docker build -f Dockerfile -t ${DOCKER_NAME} .