#!/usr/bin/env bash
#
# @file teamspeak.sh
# @brief to install docker teamspeak


# @description create docker teamspeak
# https://github.com/recalbox/recalbox-docker-build
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
 create_docker_teamspeak(){

    udocker_create_dir /home/udocker/volumes/teamspeak

    docker run -d -e TS3SERVER_LICENSE=accept --name="teamspeak_server" -p "9987:9987/udp" -p 10011:10011 -p 30033:30033 solidnerd/teamspeak
    docker logs teamspeak_server > /home/udocker/teamspeak/info.txt
    return 0
}