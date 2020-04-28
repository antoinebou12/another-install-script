#!/usr/bin/env bash

# @file kdedocker.sh
# @brief to install docker kdedocker

# @description create docker kdedocker
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_kdedocker() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" up -d

    return 0
}

# @description remove docker kdedocker
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_kdedocker() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" down
    return 0
}