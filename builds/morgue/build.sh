#!/bin/bash

# Build the image
docker build --label=morgue -t aabbate/morgue . 

# Check if the container is already running
if docker ps -a | grep -q morgue ; then
  # stop the running container
  docker stop $(docker ps -a -q -f name=morgue)
  # remove the container
  docker rm $(docker ps -a -q -f name=morgue)
fi

# Commit the build and push it to DockerHub
docker commit morgue aabbate/morgue

docker push aabbate/morgue
