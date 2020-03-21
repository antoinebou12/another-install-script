#!/usr/bin/env bash

# @file meshcentral.sh
# @brief to install docker meshcentral

# @description create docker meshcentral
# link
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_meshcentral() {

    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):4040"

    return 0
}

# @description remove docker meshcentral
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_meshcentral() {
    echo "not implemented"
    return 0
}
