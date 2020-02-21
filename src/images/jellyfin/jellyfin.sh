#!/usr/bin/env bash
# @file jellyfin.sh
# @brief to install docker jellyfin


# @description create docker jellyfin
# https://github.com/linuxserver/docker-jellyfin
# @args $1 PATH_TO_LIBRARY and config
# @args $2 PATH_TO_TV SHOW
# @args $3 PATH_TO_MOVIE 
# @args $4 PORT_WEB 8096
# @args $5 PORT_OTHER 8920
# @exitcode 0 If successfull.
# @exitcode 1 On failure
 create_docker_jellyfin(){
    docker-compose -f "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/docker-compose.yml" up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):8096"
    
    return 0
}