#!/usr/bin/env bash

# @file graylog.sh
# @brief to install docker graylog

# @description create docker graylog
# not implemented yet
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_graylog() {

    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" up -d

    return 0
}

# @description remove docker graylog
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_graylog() {
    echo "not implemented"
    return 0
}
