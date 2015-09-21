#!/bin/bash

VER=$(grep FROM Dockerfile | awk -F':' '{print $2}')

docker build --no-cache=true -t zalando/ubuntu:$VER .

SQUASH_PATH=$(which docker-squash)

if [ -z "$SQUASH_PATH" ]
then
    # install Docker Squash from https://github.com/jwilder/docker-squash
    TGZ=docker-squash-linux-amd64-v0.1.0.tar.gz
    curl -L -s https://github.com/jwilder/docker-squash/releases/download/v0.1.0/$TGZ | tar xzvf - -C /usr/local/bin
    SQUASH_PATH=$(which docker-squash)
fi

echo 'Squashing the base image to save space..'
docker save zalando/ubuntu:$VER | sudo "$SQUASH_PATH" -from root -t zalando/ubuntu:$VER | docker load

