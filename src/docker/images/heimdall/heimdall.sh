#!/usr/bin/env bash
#
# @file heimdall.sh
# @brief to install docker heimdall


# @description create docker heimdall
# https://hub.docker.com/r/linuxserver/heimdall/
# @args $1 PATH_CONFIG
# @args $2 PORT_WEB
# @args $3 PORT_WEB_HTTPS
# @exitcode 0 If successfull.
# @exitcode 1 On failure
 create_docker_heimdall(){
    PATH_CONFIG=${1:-:"/home/udocker/volumes/heimdall/config"}
    PORT_WEB=${2:-:8080}
    PORT_WEB_HTTPS=${3:-:8443}
    
    udocker_create_dir "$PATH_CONFIG"
    
    PATH_CONFIG="$PATH_CONFIG" PORT_WEB="$PORT_WEB" PORT_WEB_HTTPS="$PORT_WEB_HTTPS" docker-compose up -d 
    
    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):${PORT_WEB}"
    return 0
}