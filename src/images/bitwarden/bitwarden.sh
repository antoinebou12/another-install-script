#!/usr/bin/env bash

# @file bitwarden.sh
# @brief to install docker bitwarden

# @description create docker bitwarden
# link
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_.template() {
    curl -s -o bitwarden.sh \
        https://raw.githubusercontent.com/bitwarden/server/master/scripts/bitwarden.sh &&
        chmod +x bitwarden.sh
    ./bitwarden.sh install
    ./bitwarden.sh start

    docker-compose -f "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/docker-compose.yml" up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):4040"

    return 0
}
