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
    docker run -p 8090:8080 --mount type=bind,source="/home/udocker/olaris",target=/var/media --mount type=bind,source="home/udocker/olaris/config",target=/home/olaris/.config/olaris --mount type=bind,source="home/udocker/olaris/config/rclone",target="/home/olaris/.config/rclone" -e OLARIS_UID=$(id -u) -e OLARIS_GID=$(id -g) olaristv/olaris-server
    return 0
 }
