#!/usr/bin/env bash
#
# @file recalbox.sh
# @brief to install docker recalbox


# @description create docker recalbox
# https://github.com/recalbox/recalbox-docker-build
# @args $1 PATH_RECALBOX
# @exitcode 0 If successfull.
# @exitcode 1 On failure
function create_docker_recalbox(){
    mkdir /home/docker/recalbox/
    PATH_RECALBOX=${1:-"/home/docker/recalbox"}
    docker run -t -v $PATH_RECALBOX:/usr/share/recalbox/build/ recalbox/recalbox-docker-build
    return 0
}