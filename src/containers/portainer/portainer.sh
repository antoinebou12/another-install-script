#!/usr/bin/env bash

# @file portainer.sh
# @brief to install docker portainer

# @description create docker portainer
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_portainer() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):9001"

    return 0
}

# @description remove docker portainer
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_portainer() {
    echo "not implemented"
    return 0
}
