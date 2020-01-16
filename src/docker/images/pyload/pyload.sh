#!/usr/bin/env bash
#
# @file pyload.sh
# @brief to install docker pyload

# @description create docker syncthing
# https://github.com/linuxserver/docker-pyload/issues/3
# @args $1 PATH_CONFIG
# @args $2 PATH_DOWNLOAD
# @args $3 PORT_WEB
# @exitcode 0 If successfull.
# @exitcode 1 On failure
fucntion create_docker_pyload(){
    mkdir /home/docker/pyload
    PATH_CONFIG=${1:-"/home/docker/pyload/config"}
    PATH_DOWNLOAD=${2:-"/home/docker/pyload/download"}
    PORT_WEB=${3:-"8001"}
    PATH_CONFIG=$PATH_CONFIG PATH_DOWNLOAD=$PATH_DOWNLOAD PORT_WEB=$PORT_WEB docker-compose up -d
    return 0
}