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

    stop_containers_all
    prune_images_volumes_all
    remove_containers_all

    aptupdate
    apt-get remove -y snapd bat nnn nmap wget curl bats mlocate mutt python3 python3-pip alsa-utils wireless-tools wpasupplicant zip unzip git cmake build-essential default-jre jq docker cockpit cockpit-docker cockpit-machines cockpit-packagekit docker-ce docker-ce-cli containerd.io
    snap remove hub
    aptclean

    rm -rf /opt/signal-cli-0.6.5/bin/signal-cli /usr/local/bin/
    rm -rf /usr/local/bin/emojify
    rm -rf /usr/local/bin/docker-compose
    rm -rf /usr/bin/docker-compose

    userdel -r docker
    return 0
}

uninstall
exit 0