#!/bin/bash
for i in $(seq 1 20)
do
  docker stop $(docker ps -aq) > /dev/null 2>&1
  docker rm $(docker ps -aq) > /dev/null 2>&1
  docker rmi -f $(docker images -aq) > /dev/null 2>&1
  echo -n "$(date +%Y%m%d%H%M%S)"
  echo -n "---"
  echo ${i}
  docker pull busybox
  sleep 1
  docker pull alpine
  sleep 1
done
