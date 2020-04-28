#!/usr/bin/env bash
#
# @file opentogethertube.sh
# @brief to install docker opentogethertube

# @description create docker opentogethertube
# https://github.com/antoinebou13/opentogethertube/tree/docker
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_olaris() {
   docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" up -d

   echo "ctrl+click to open in browser"
   echo "$(get_current_ip):6666"
   return 0
}

# @description remove docker opentogethertube
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_opentogethertube() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" down
    return 0
}
