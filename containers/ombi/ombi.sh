#!/usr/bin/env bash

# @file ombi.sh
# @brief to install docker ombi

# @description create docker ombi
# link
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_ombi() {

    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):3579"

    return 0
}

# @description remove docker ombi
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_ombi() {
    echo "not implemented"
    return 0
}
