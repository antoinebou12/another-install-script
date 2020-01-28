#!/usr/bin/env bash

# @file deluge.sh
# @brief to install docker deluge



# @description create docker deluge
# not implemented yet
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_deluge(){
    echo "not implemented yet"

    exec_root mkdir -p /home/udocker/volumes/deluge/config
    exec_root chmod 755 /home/udocker/volumes/deluge/config
    exec_root chown udocker:udocker /home/udocker/volumes/deluge/config

    exec_root mkdir -p /home/udocker/volumes/deluge/download
    exec_root chmod 755 /home/udocker/volumes/deluge/download
    exec_root chown udocker:udocker /home/udocker/volumes/deluge/download


    return 1
}