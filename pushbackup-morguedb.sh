#!/bin/bash

# Set the TAG
TAG=$(date +"%Y.%m.%d-%H.%M.%S")

if docker ps -a | grep -q dockermorgue_morguedb_1 ; then
    docker commit -p dockermorgue_morguedb_1 aabbate/morguedb:${TAG}
    docker push aabbate/morguedb:${TAG}
fi
