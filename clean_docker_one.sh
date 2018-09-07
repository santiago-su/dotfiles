#!/bin/bash
# cleanup-docker

set -x

docker ps -a | grep Up | awk '{print $1}' | xargs docker stop
docker ps -a -q | xargs docker rm
docker images --filter dangling=true -q | sort -u | xargs docker rmi
docker volume rm $(docker volume ls -qf dangling=true)
docker network ls | grep -v `docker network ls --filter name=bridge -q` | awk '/bridge/{system("docker network rm " $1)}'

docker image prune -a
