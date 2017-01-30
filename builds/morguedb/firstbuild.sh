#!/bin/bash

# Set the tag with current date
TAG=$(date +"%Y.%m.%d-%H.%M.%S")

# Start mariadb basic container
docker run -d -p 3306:3306 --name mariadb aabbate/mariadb 

# Copy the init files inside the container
docker cp ./init.sh mariadb:/init.sh 
docker cp ./install.sql mariadb:/install.sql 
docker cp ./schemas mariadb:/schemas

# Init morgue db
docker exec mariadb "/init.sh"

# Push the base container to aabbate/morguedb
if docker ps -a | grep -q mariadb ; then
	docker commit -p mariadb aabbate/morguedb:${TAG}
	docker push aabbate/morguedb:${TAG}
	docker push aabbate/morguedb:latest
fi