#!/usr/bin/env bash

# @file wireguard.sh
# @brief to install docker wireguard

# @description create docker ubuntuxrdp
# https://github.com/cmulk/wireguard-docker
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_wireguard() {
    cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1

    udocker_create_dir /home/udocker/wireguard

    docker run -it --rm cmulk/wireguard-docker:buster genkeys
    docker-compose up -d

}
