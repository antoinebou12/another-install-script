#!/usr/bin/env bash

# @file gogs.sh
# @brief to install docker gogs

# @description create docker gogs
# link
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_gogs() {
     docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" up -d
     return 0
}

# @description remove docker gogs
# link
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_gogs() {
     docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" down
     return 0
}
