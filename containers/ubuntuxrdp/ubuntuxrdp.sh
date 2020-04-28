#!/usr/bin/env bash

# @file ubuntuxrdp.sh
# @brief to install docker ubuntuxrdp

# @description create docker ubuntuxrdp
# https://hub.docker.com/r/danielguerra/ubuntu-xrdp/
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_ubuntuxrdp() {

    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" up -d

    echo "Username: ubuntu Password: ubuntu"
}

# @description remove docker ubuntuxrdp
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_ubuntuxrdp() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" down
    return 0
}
