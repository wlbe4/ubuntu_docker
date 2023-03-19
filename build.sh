#!/bin/bash
# current uid and gid
source names.sh
docker build -f Dockerfile -t ${DOCKER_NAME} .