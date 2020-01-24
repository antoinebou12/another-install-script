#!/usr/bin/env bash
#
# @file mcmyadmin.sh
# @brief to install docker mcmyadmin


# @description create docker mcmyadmin
# https://github.com/linuxserver-archive/docker-mcmyadmin2
# @args $1 the name of the container
# @args $2 the path to the minecraft data
# @args $3 port for the web server
# @args $4 port for the minecraft server
# @exitcode 0 If successfull.
# @exitcode 1 On failure
 create_docker_mcmyadmin(){
    mkdir /home/docker/mcmydocker
    name=${1:-"mcmyadmin"}
    path_data=${2:-"/home/docker/minecraft"}
    port_web=${3:-8080}
    port_minecraft=${4:-25565}

    docker create --name="$name" -v "$path_data":/minecraft -p "$port_web":8080 -p "$port_minecraft":25565 linuxserver/mcmyadmin2
    return 0
}
