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

    docker-compose -f "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/docker-compose.yml" up -d

    docker logs teamspeak_server > /home/udocker/teamspeak/info.txt
    cat /home/udocker/teamspeak/info.txt
    return 0
}