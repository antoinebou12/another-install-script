#!/usr/bin/env bash

# @file ubuntuxrdp.sh
# @brief to install docker ubuntuxrdp

# @description create docker ubuntuxrdp
# https://hub.docker.com/r/danielguerra/ubuntu-xrdp/
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_ubuntuxrdp() {
    cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1

    docker-compose up -d

    echo "Username: ubuntu Password: ubuntu"
}
