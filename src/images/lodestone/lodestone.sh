#!/usr/bin/env bash

# @file lodestone.sh
# @brief to install docker lodestone

# @description create docker lodestone
# link
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_lodestone() {
     docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" up -d

     echo "ctrl+click to open in browser"
     echo "$(get_current_ip):8034"
     return 0
}

# @description remove docker lodestone
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_lodestone() {
     echo "not implemented"
     return 0
}
