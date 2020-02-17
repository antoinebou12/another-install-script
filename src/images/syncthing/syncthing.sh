#!/usr/bin/env bash
#
# @file syncthing.sh
# @brief to install docker syncthing

# @description create docker syncthing
# https://github.com/syncthing/syncthing

# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_syncthing() {

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):${PORT_WEB}"
    return 0
}
