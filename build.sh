#!/bin/bash

set -xe

export REPO=${REPO:-heartysoft/nginx-secure-proxy}
export TAG_TO_USE=${TRAVIS_TAG:-snapshot}
docker build -t $REPO:latest .
docker tag $REPO:latest $REPO:$TAG_TO_USE

