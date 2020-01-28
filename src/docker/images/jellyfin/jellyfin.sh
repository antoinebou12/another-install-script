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
    PATH_TO_LIBRARY=${1:-"/home/udocker/volumes/jellyfin/config"}
    PATH_TO_TV=${2:-"/home/udocker/volumes/jellyfin/tv"}
    PATH_TO_MOVIE=${3:-"/home/udocker/volumes/jellyfin/movie"}
    PORT_WEB=${4:-8096}
    PORT_OTHER=${5:-:8920}

    
    exec_root mkdir -p "$PATH_TO_LIBRARY"
    exec_root chmod 755 "$PATH_TO_LIBRARY"
    exec_root chown udocker:udocker "$PATH_TO_LIBRARY"

    exec_root mkdir -p "$PATH_TO_MOVIE"
    exec_root chmod 755 "$PATH_TO_MOVIE"
    exec_root chown udocker:udocker "$PATH_TO_MOVIE"

    exec_root mkdir -p "$PATH_TO_MOVIE"
    exec_root chmod 755 "$PATH_TO_MOVIE"
    exec_root chown udocker:udocker "$PATH_TO_MOVIE"

    PATH_TO_LIBRARY=$PATH_TO_LIBRARY PATH_TO_TV=$PATH_TO_TV PATH_TO_MOVIE=$PATH_TO_MOVIE PORT_WEB=$PORT_WEB PORT_OTHER=$PORT_OTHER docker-compose up -d
    return 0
}