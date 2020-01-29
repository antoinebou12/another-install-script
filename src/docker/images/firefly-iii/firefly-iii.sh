#!/usr/bin/env bash
#
# @file firefly-iii.sh
# @brief to install docker firefly-iii


# @description create docker firefly-iii
# https://github.com/firefly-iii/docker
# @args $1 PORT_WEB
# @args $2 PATH_DB
# @args $3 PATH_EXPORT
# @args $4 PATH_UPLOAD
# @args $4 POSTGRES_PASSWORD
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_firefly-iii(){
    PORT_WEB=${1:-"8087"}
    PATH_DB=${2:-"/home/udocker/volumes/firefly-iii/db"}
    PATH_EXPORT=${3:-"/home/udocker/volumes/firefly-iii/export"}
    PATH_UPLOAD=${4:-"/home/udocker/volumes/firefly-iii/upload"}
    POSTGRES_PASSWORD=${5:-"firefly"}

    exec_root mkdir -p "$PATH_DB"
    exec_root chmod 755 "$PATH_DB"
    exec_root chown udocker:udocker "$PATH_DB"

    exec_root mkdir -p "$PATH_EXPORT"
    exec_root chmod 755 "$PATH_EXPORT"
    exec_root chown udocker:udocker "$PATH_EXPORT"

    exec_root mkdir -p "$PATH_UPLOAD"
    exec_root chmod 755 "$PATH_UPLOAD"
    exec_root chown udocker:udocker "$PATH_PATH_UPLOAD"

    PORT_WEB="${PORT_WEB}" PATH_DB="${PATH_DB}" PATH_EXPORT="${PATH_DB}" PATH_UPLOAD="${PATH_UPLOAD}" POSTGRES_PASSWORD="${POSTGRES_PASSWORD}" docker-compose up -d
       
    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):${PORT_WEB}"

    return 0
}