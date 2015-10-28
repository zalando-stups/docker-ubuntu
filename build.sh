#!/bin/bash

VER=$(cat VERSION)

docker build --no-cache=true -t zalando/ubuntu:$VER .

SQUASH_PATH=$(which docker-squash)
SQUASH_VERSION="0.2.0"

if [ -z "$SQUASH_PATH" ]; then
    # install Docker Squash from https://github.com/jwilder/docker-squash
    TGZ=docker-squash-linux-amd64-v${SQUASH_VERSION}.tar.gz
    wget https://github.com/jwilder/docker-squash/releases/download/v${SQUASH_VERSION}/$TGZ
    sudo tar -C /usr/local/bin -xzvf $TGZ
    rm $TGZ
    SQUASH_PATH=$(which docker-squash)
fi

echo 'Squashing the base image to save space..'
docker save zalando/ubuntu:$VER | sudo "$SQUASH_PATH" -verbose -from root -t zalando/ubuntu:$VER | docker load
