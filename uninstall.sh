#!/bin/bash
#
# @file uninstall.sh
# @brief uninstall the project

# shellcheck source=config.sh
# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/config.sh"
# shellcheck source=src/containers.sh
# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/containers.sh"
# shellcheck source=src/docker.sh
# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker.sh"
# shellcheck source=src/firewall.sh
# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/firewall.sh"
# shellcheck source=src/install.sh
# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/install.sh"
# shellcheck source=src/menu.sh
# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/menu.sh"
# shellcheck source=src/other.sh
# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/other.sh"
# shellcheck source=src/router.sh
# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/router.sh"
# shellcheck source=src/utils
# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/utils.sh"

# @description uninstall everything
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
uninstall() {
    dist_check

    sed '/UDOCKER_USERID/d' /etc/environment
    sed '/UDOCKER_GROUPID/d' /etc/environment

    echo "Uninstall"
    print_line

    dist_check

    if check_packages_install docker; then
        stop_containers_all
        prune_containers_volumes_all
        remove_containers_all
    fi

    aptupdate
    aptremove nmap
    aptremove nnn
    aptremove bats
    aptremove mlocate
    aptremove mutt 
    aptremove alsa-utils
    aptremove wireless-tools
    aptremove wpasupplicant
    aptremove zip
    aptremove unzip
    aptremove cmake 
    aptremove default-jre
    aptremove jq
    aptremove firefox

    aptremove cockpit 
    aptremove cockpit-docker
    aptremove cockpit-machines
    aptremove cockpit-packagekit

    aptremove docker 
    aptremove docker-ce
    aptremove docker-ce-cli
    aptremove containerd.io
    aptclean

    aptremove ansible
    aptclean

    exec_root rm -rf /opt/signal-cli-0.6.5/bin/signal-cli
    exec_root rm -rf  /usr/local/bin/signal-cli
    exec_root rm -rf /usr/local/bin/emojify
    exec_root rm -rf /usr/local/bin/docker-compose
    exec_root rm -rf /usr/bin/docker-compose

    exec_root userdel -f udocker > /dev/null

    print_line
    return 0
}

uninstall
