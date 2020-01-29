#!/usr/bin/env bash

# @file cloud-torrent.sh
# @brief to install docker cloud-torrent


# @description create docker heimdall
# https://github.com/jpillora/cloud-torrent
# @args $1 PORT_WEB 6889
# @args $2 USERNAME admin
# @args $3 PASSWORD password
# @args $4 PATH_DOWNLOAD
# @exitcode 0 If successfull.
# @exitcode 1 On failure
 create_docker_cloud-torrent(){
    cd /home/udocker/ || return 1
    PORT_WEB=${1:-"6889"}
    USERNAME=${2:-"admin"}
    PASSWORD=${3:-"password"}
    PATH_DOWNLOAD=${4:-"/home/udocker/volumes/cloud-torrent/download"}

    exec_root mkdir -p "$PATH_DOWNLOAD"
    exec_root chmod 755 "$PATH_DOWNLOAD"
    exec_root chown udocker:udocker "$PATH_DOWNLOAD"


    docker build --build-arg USERNAME="$USERNAME" PASSWORD="$PASSWORD"
    docker run -d -p "$PORT_WEB":3000 -v "$PATH_DOWNLOAD":/downloads jpillora/cloud-torrent

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):${PORT_WEB}"
    
    return 0
}