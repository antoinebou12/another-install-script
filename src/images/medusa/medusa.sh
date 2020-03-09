#!/usr/bin/env bash
#
# @file medusa.sh
# @brief to install docker medusa

# @description create docker medusa
# https://github.com/linuxserver/docker-medusa
# @exitcode 0 If successfull.
# @exitcode 1 On failure
 create_docker_medusa(){
    exec_root docker-compose up -d
    return 0
}

# @description remove docker medusa
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_medusa() {
    echo "not implemented"
    return 0
}