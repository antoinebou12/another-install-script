#!/usr/bin/env bash

# @file neko.sh
# @brief to install docker neko



# @description create docker neko
# not implemented yet
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_neko(){
    set -e
    cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1
    docker-compose up -d

    exit 0
    echo "not implemented yet"
    return 1
}