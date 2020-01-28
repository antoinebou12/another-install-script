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
 create_docker_medusa(){
    mkdir /home/udocker/medusa
    PATH_CONFIG=${1:-"/home/udocker/volumes/medusa/config"}
    PATH_DOWNLOAD=${2:-"/home/udocker/volumes/medusa/download"}
    PATH_TV=${3:-"/home/udocker/volumes/medusa/tv"}
    PORT_WEB=${4:-"8081"}

    exec_root mkdir -p "$PATH_CONFIG"
    exec_root chmod 755 "$PATH_CONFIG"
    exec_root chown udocker:udocker "$PATH_CONFIG"

    exec_root mkdir -p "$PATH_DOWNLOAD"
    exec_root chmod 755 "$PATH_DOWNLOAD"
    exec_root chown udocker:udocker "$PATH_DOWNLOAD"

    exec_root mkdir -p "$PATH_TV"
    exec_root chmod 755 "$PATH_TV"
    exec_root chown udocker:udocker "$PATH_TV"

    PATH_CONFIG="$PATH_CONFIG" PATH_DOWNLOAD="$PATH_DOWNLOAD" PATH_TV="$PATH_TV" PORT_WEB="$PORT_WEB" docker-compose up -d
    return 0
}