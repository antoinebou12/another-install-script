#!/usr/bin/env bash
#
# @file jupyterlab.sh
# @brief to install docker jupyterlab

# @description create docker jupyterlab
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_jupyterlab() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):8888"

    return 0
}

# @description remove docker jupyterlab
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_jupyterlab() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" down
    return 0
}
