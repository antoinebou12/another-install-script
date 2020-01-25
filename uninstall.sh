#!/bin/bash
#
# @file uninstall.sh
# @brief uninstall the project

source src/docker/docker.sh
source src/utils.sh

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
    aptremove wget
    aptremove curl
    aptremove bats
    aptremove mlocate
    aptremove mutt 
    aptremove python3
    aptremove python3-pip
    aptremove alsa-utils
    aptremove wireless-tools
    aptremove wpasupplicant
    aptremove zip
    aptremove unzip
    aptremove git
    aptremove cmake 
    aptremove build-essential
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
    # snap remove hub > /dev/null  
    aptclean

    rm -rf /opt/signal-cli-0.6.5/bin/signal-cli /usr/local/bin/
    rm -rf /usr/local/bin/emojify
    rm -rf /usr/local/bin/docker-compose
    rm -rf /usr/bin/docker-compose

    exec_root "userdel -r docker" > /dev/null
    return 0
}

uninstall
exit 0