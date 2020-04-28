#!/usr/bin/env bash

# @file libresignature.sh
# @brief to install docker libresignature



# @description create docker libresignature
# not implemented yet
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_libresignature(){
    docker-compose -f "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/docker-compose.yml" up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):8030"
    return 0
}

# @description remove docker libresignage
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_libresignage() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" down
    return 0
}

