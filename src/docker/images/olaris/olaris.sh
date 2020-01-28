#!/usr/bin/env bash
#
# @file firefly-iii.sh
# @brief to install docker firefly-iii


# @description create docker firefly-iii
# https://github.com/firefly-iii/docker
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
 create_docker_olaris(){

    exec_root mkdir -p /home/udocker/volumes/olaris
    exec_root chmod 755 /home/udocker/volumes/olaris
    exec_root chown udocker:udocker /home/udocker/volumes/olaris

    exec_root mkdir -p /home/udocker/volumes/olaris/config
    exec_root chmod 755 /home/udocker/volumes/olaris/config
    exec_root chown udocker:udocker /home/udocker/volumes/olaris/config

    exec_root mkdir -p /home/udocker/volumes/olaris/config/rclone
    exec_root chmod 755 /home/udocker/volumes/olaris/config/rclone
    exec_root chown udocker:udocker /home/udocker/volumes/olaris/config/rclone

    docker run -p 8090:8080 --mount type=bind,source="/home/udocker/olaris",target=/var/media --mount type=bind,source="/home/udocker/olaris/config",target=/home/olaris/.config/olaris --mount type=bind,source="/home/udocker/olaris/config/rclone",target="/home/olaris/.config/rclone" olaristv/olaris-server
    return 0
 }
