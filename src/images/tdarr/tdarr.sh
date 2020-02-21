#!/usr/bin/env bash

# @file tdarr.sh
# @brief to install docker tdarr

# @description create docker tdarr
# not implemented yet
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_tdarr() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" up -d

    return 0
}
