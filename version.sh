#!/usr/bin/env bash
#
# @file semver.sh
# @brief semver https://semver.org/


# @description install semver
# https://github.com/fsaintjacques/semver-tool
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
install_semver(){
    wget https://raw.githubusercontent.com/fsaintjacques/semver-tool/master/src/semver > /dev/null
    if  [[ "$UID" -gt 0 ]]; then
        sudo mv semver /usr/local/bin/
        sudo chmod 755 /usr/local/bin/semver
    else
        mv semver /usr/local/bin/
        chmod 755 /usr/local/bin/semver
    fi
    return 0
}

# @description use semver ci
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
use_semver(){
    semver bump $1 $(cat version)
}
use_semver $1