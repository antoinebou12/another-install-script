#!/usr/bin/env bash

# @file openstreamingplatform.sh
# @brief to install docker openstreamingplatform

# @description create docker openstreamingplatform
# not implemented yet
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_openstreamingplatform() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):8585"

    return 0
}

# @description remove docker openstreamingplatform
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_openstreamingplatform() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" down
    return 0
}