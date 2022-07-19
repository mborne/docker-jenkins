#!/bin/bash

#-----------------------------------------------------------------------
# Ensure that jenkins user is allowed to access /var/run/docker.sock
# https://github.com/jenkinsci/docker/issues/263#issuecomment-217955379
#-----------------------------------------------------------------------
if [ -S /var/run/docker.sock ]; then
    echo "Create docker group with gid corresponding to /var/run/docker.sock..."
    DOCKER_GID=$(stat -c '%g' /var/run/docker.sock)
    addgroup --gid=${DOCKER_GID} docker
    echo "Add jenkins to docker group..."
    usermod -a -G docker jenkins
fi

#-----------------------------------------------------------------------
# Run jenkins a jenkins user
#-----------------------------------------------------------------------
gosu jenkins /usr/local/bin/jenkins.sh
