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
 create_docker_mailcow(){
    exec_root mkdir -p /home/udocker/volumes/mailcow
    exec_root chmod 755 /home/udocker/volumes/mailcow
    exec_root chown udocker:udocker /home/udocker/volumes/mailcow

    cd /home/udocker/mailcow || return 1
    git clone https://github.com/mailcow/mailcow-dockerized
    cd mailcow-dockerized || return 1
    ./generate_config.sh
    nano mailcow.conf
    exec_root docker-compose pull
    exec_root docker-compose up -d
    return 0
}