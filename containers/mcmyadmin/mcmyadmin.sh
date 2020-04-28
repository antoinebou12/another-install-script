#!/usr/bin/env bash
#
# @file mcmyadmin.sh
# @brief to install docker mcmyadmin


# @description create docker mcmyadmin
# https://github.com/linuxserver-archive/docker-mcmyadmin2
# @exitcode 0 If successfull.
# @exitcode 1 On failure
 create_docker_mcmyadmin(){
    docker-compose -f "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/docker-compose.yml" up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):8037"
    return 0
}

# @description remove docker mcmyadmin
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_mcmyadmin() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" down
    return 0
}