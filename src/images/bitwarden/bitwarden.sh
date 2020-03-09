#!/usr/bin/env bash

# @file bitwarden.sh
# @brief to install docker bitwarden

# @description create docker bitwarden
# link
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_.template() {
    CURRENT_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
    curl -s -o "$CURRENT_DIRECTORY/bitwarden.sh" \
        https://raw.githubusercontent.com/bitwarden/server/master/scripts/bitwarden.sh &&
        chmod +x "$CURRENT_DIRECTORY/bitwarden.sh"
    bash "$CURRENT_DIRECTORY/bitwarden.sh" install
    bash "$CURRENT_DIRECTORY/bitwarden.sh" start
    
    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):4040"

    return 0
}
