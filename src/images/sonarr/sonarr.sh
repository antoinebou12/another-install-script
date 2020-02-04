#!/usr/bin/env bash

# @file sonarr.sh
# @brief to install docker sonarr



# @description create docker sonarr
# not implemented yet
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_sonarr(){

    udocker_create_dir /home/udocker/sonarr/config
    udocker_create_dir /home/udocker/sonarr/tv
    udocker_create_dir /home/udocker/sonarr/downloads


    docker run -u udocker --name=sonarr -p 8989:8989 -v /dev/rtc:/dev/rtc:ro -v /home/udocker/sonarr/config:/config  -v /home/udocker/sonarr/tv:/tv  -v /home/udocker/sonarr/downloads:/downloads linuxserver/sonarr
    echo "not implemented yet"
    return 1
}