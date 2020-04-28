#!/usr/bin/env bash

# @file kimai.sh
# @brief to install docker kimai

# @description create docker kimai
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_kimai() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" up -d

    return 0
}

# @description remove docker kimai
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_kimai() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" down
    return 0
}