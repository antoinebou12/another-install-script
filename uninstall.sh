#!/bin/bash
#
# @file uninstall.sh
# @brief uninstall the project

source "$(dirname "${BASH_SOURCE[0]}")/src/container.sh"
source "$(dirname "${BASH_SOURCE[0]}")/src/docker.sh"
source "$(dirname "${BASH_SOURCE[0]}")/src/utils.sh"

# @description uninstall everything
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
uninstall() {

    if check_packages_install docker; then
        stop_containers_all
        prune_images_volumes_all
        remove_containers_all
    fi

    aptupdate
    aptremove snapd
    aptremove bat 
    aptremove nnn
    aptremove nmap
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
    aptremove docker 
    aptremove cockpit 
    aptremove cockpit-docker
    aptremove cockpit-machines
    aptremove cockpit-packagekit
    aptremove docker-ce
    aptremove docker-ce-cli
    aptremove containerd.io
    aptremove ansible
    # snap remove hub > /dev/null  
    aptclean

    exec_root rm -rf /opt/signal-cli-0.6.5/bin/signal-cli /usr/local/bin/signal-cli
    exec_root rm -rf /usr/local/bin/emojify
    exec_root rm -rf /usr/local/bin/docker-compose
    exec_root rm -rf /usr/bin/docker-compose

    exec_root userdel -f udocker > /dev/null
    exec_root groupdel docker > /dev/null
    return 0
}

uninstall
exit 0