#!/usr/bin/env bash

# @file grafana.sh
# @brief to install docker grafana

# @description create docker grafana
# not implemented yet
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_grafana() {
    docker-compose -f "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/docker-compose.yml" up -d

    return 0
}
