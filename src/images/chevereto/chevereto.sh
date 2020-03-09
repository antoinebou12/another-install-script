#!/usr/bin/env bash
# @file chevereto.sh
# @brief to install docker chevereto

# @description create docker chevereto
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_chevereto() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):8999"

    return 0
}
