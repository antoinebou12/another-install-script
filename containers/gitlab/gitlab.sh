#!/usr/bin/env bash

# @file gitlab.sh
# @brief to install docker gitlab

# @description create docker gitlab
# not implemented yet
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_gitlab() {
    
    docker-compose -f "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/docker-compose.yml" up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):8009"

    return 0
}

# @description remove docker gitlab
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_gitlab() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" down
    return 0
}