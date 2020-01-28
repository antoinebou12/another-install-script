#!/usr/bin/env bash

# @file gitea.sh
# @brief to install docker gitea



# @description create docker gitea
# not implemented yet
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_gitea(){
    echo "not implemented yet"

    exec_root mkdir -p /home/udocker/volumes/gitea
    exec_root chmod 755 /home/udocker/volumes/gitea
    exec_root chown udocker:udocker /home/udocker/volumes/gitea

    return 1
}