#!/bin/bash

if [ $# -lt 1 ]; then
  echo "First argument should be the path to your .ssb directory (or where you want to have it created)"
  exit 1
fi

# better isolation of X host, without hardcoding user ID https://github.com/sameersbn/docker-browser-box/blob/master/entrypoint.sh
# all the reasoning: http://wiki.ros.org/docker/Tutorials/GUI

SSBDIR="$1"

xhost +local:docker
docker run --rm -it -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY -v $SSBDIR:/root/.ssb ginseadd/patchwork npm start
xhost -local:docker
