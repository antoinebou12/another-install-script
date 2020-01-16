#!/usr/bin/env bash
#
# @file syncthing.sh
# @brief to install docker syncthing


# @description create docker syncthing
# https://github.com/syncthing/syncthing
# @args $1 PORT_WEB
# @args $2 PORT_SYNC
# @args $3 PATH_SYNC
# @exitcode 0 If successfull.
# @exitcode 1 On failure
function create_docker_syncthing(){
    mkdir /home/docker/syncthing/
    PORT_WEB=${1:-"6889"}
    PORT_SYNC=${2:-"6889"}
    PATH_SYNC=${3:-"/home/docker/syncthing/"}
    docker run -p $PORT_WEB:8384 -p $PORT_SYNC:22000 -v $PATH_SYNC:/var/syncthing syncthing/syncthing:latest
    return 0
}