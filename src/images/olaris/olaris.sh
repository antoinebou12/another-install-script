#!/usr/bin/env bash
#
# @file olaris.sh
# @brief to install docker folaris

# @description create docker olaris
# https://gitlab.com/olaris/olaris-server
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_olaris() {
   docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" up -d

   echo "ctrl+click to open in browser"
   echo "$(get_current_ip):8043"
   return 0
}

# @description remove docker olaris
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_olaris() {
    echo "not implemented"
    return 0
}