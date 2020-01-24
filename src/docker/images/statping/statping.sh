#!/usr/bin/env bash
#
# @file statping.sh
# @brief to install docker statping

# @description create docker statping
# https://github.com/hunterlong/statping/wiki/Docker
# @args $1 PORT_WEB
# @args $2 PATH_STATPING
# @exitcode 0 If successfull.
# @exitcode 1 On failure
function create_docker_statping(){
    mkdir /home/docker/statping/
    PORT_WEB=${1:-"8084"}
    PATH_STATPING=${2:-"/home/docker/statping/"}
    docker run -d -p "$PORT_WEB":8080 -v "$PATH_STATPING":/app --restart always hunterlong/statping
    return 0
}