#!/usr/bin/env bash
#
# @file install.sh
# @brief install my favirote packages for ubuntu18.04 and tested 

# import
source utils.sh

function install_basic(){
    # apt-get ubuntu 18.04
    apt-get update -qq
    apt-get install -y bat nnn nmap wget curl bats mlocate heirloom-mailx python3 python3-pip

    # snap package
    snap install hub
}

# @description install the cockpit to web 
# See your server in a web browser and perform system tasks with a mouse. It’s easy to start containers, administer storage, configure networks, and inspect logs.
# https://cockpit-project.org/
# @noargs
function install_cockpit(){
    apt-get -qq update
    apt-get -q -y install cockpit cockpit-docker cockpit-machines cockpit-packagekit
    systemctl restart cockpit
}