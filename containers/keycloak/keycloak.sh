#!/usr/bin/env bash

# @file keycloak.sh
# @brief to install docker keycloak

# @description create docker keycloak
# not implemented yet
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_keycloak() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):8050"
    return 0
}

# @description remove docker keycloak
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_keycloak() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" down
    return 0
}
