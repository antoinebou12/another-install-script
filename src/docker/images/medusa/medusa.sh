#!/usr/bin/env bash
#
# @file medusa.sh
# @brief to install docker medusa

# @description create docker medusa
# https://github.com/linuxserver/docker-medusa
# @args $1 PATH_CONFIG
# @args $2 PATH_DOWNLOAD
# @args $3 PORT_WEB
# @exitcode 0 If successfull.
# @exitcode 1 On failure
fucntion create_docker_medusa(){
    mkdir /home/docker/medusa
    PATH_CONFIG=${1:-"/home/docker/medusa/config"}
    PATH_DOWNLOAD=${2:-"/home/docker/medusa/download"}
    PATH_TV=${3:-"/home/docker/medusa/tv"}
    PORT_WEB=${4:-"8081"}
    PATH_CONFIG=$PATH_CONFIG PATH_DOWNLOAD=$PATH_DOWNLOAD PATH_TV=$PATH_TV= PORT_WEB=$PORT_WEB docker-compose up -d
    return 0
}