#!/usr/bin/env bash

# @file lychee.sh
# @brief to install docker lychee

# @description create docker lychee
# link
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_lychee() {
     docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" up -d

     echo "ctrl+click to open in browser"
     echo "$(get_current_ip):8035"
     return 0
}

# @description remove docker lychee
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_lychee() {
     docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" down
     return 0
}
