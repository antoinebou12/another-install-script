#!/usr/bin/env bash
#
# @file mailcow.sh
# @brief to install dockermailcow

# @description create docker mailcow
# https://github.com/mailcow/mailcow-dockerized
# https://mailcow.github.io/mailcow-dockerized-docs/i_u_m_install/
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
function create_docker_mailcow(){
    set -e
    mkdir /home/docker/mailcow
    cd /home/docker/mailcow || return 1
    git clone https://github.com/mailcow/mailcow-dockerized
    cd mailcow-dockerized || return 1
    ./generate_config.sh
    nano mailcow.conf
    docker-compose pull
    docker-compose up -d
    return 0
}