#!/bin/bash
#
# @file Install bac
# @brief Small description of the script.


function install_basic(){
    # apt-get ubuntu 18.04
    apt-get update -qq
    apt-get install -y bat nnn nmap wget curl bats mlocate heirloom-mailx python3 python3-pip

    # snap package
    snap install hub
}

# @description install the cockpit 
# https://cockpit-project.org/
# @noargs
function install_cockpit(){
    apt-get -qq update
    apt-get -q -y install cockpit cockpit-docker cockpit-machines cockpit-packagekit
    systemctl restart cockpit
}