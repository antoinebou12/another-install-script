#!/usr/bin/env bash

# @file huginn.sh
# @brief to install docker huginn



# @description create docker huginn
# not implemented yet
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
 create_docker_huginn(){
    PORT_WEB=${1:-"3009"}
    PATH_MYSQL=${2:-"/home/udocker/volumes/huginn/mysql-data"}

    exec_root mkdir -p "$PATH_MYSQL"
    exec_root chmod 755 "$PATH_MYSQL"
    exec_root chown udocker:udocker "$PATH_MYSQL"


    docker run -it -d --name huginn -p 3009:3000 -v /home/huginn/mysql-data:/var/lib/mysql huginn/huginn
    return 0
}