#!/usr/bin/env bash
#
# @file recalbox.sh
# @brief to install docker recalbox


# @description create docker recalbox
# https://github.com/recalbox/recalbox-docker-build
# @args $1 PATH_RECALBOX
# @exitcode 0 If successfull.
# @exitcode 1 On failure
 create_docker_recalbox(){
    PATH_RECALBOX=${1:-"/home/udocker/recalbox"}

    exec_root mkdir -p "$PATH_RECALBOX"
    exec_root chmod 755 "$PATH_RECALBOX"
    exec_root chown udocker:udocker "$PATH_RECALBOX"

    docker run -t -v "$PATH_RECALBOX":/usr/share/recalbox/build/ recalbox/recalbox-docker-build
    return 0
}