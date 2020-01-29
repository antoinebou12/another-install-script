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
 create_docker_syncthing(){
    PORT_WEB=${1:-"8384"}
    PORT_SYNC=${2:-"22000"}
    PATH_SYNC=${3:-"/home/udocker/volumes/syncthing"}

    exec_root mkdir -p "$PATH_SYNC"
    exec_root chmod 755 "$PATH_SYNC"
    exec_root chown udocker:udocker "$PATH_SYNC"

    docker run --name syncthing -d -p "$PORT_WEB":8384 -p "$PORT_SYNC":22000 -v "$PATH_SYNC":/var/syncthing syncthing/syncthing:latest
    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):${PORT_WEB}"
    return 0
}