#!/usr/bin/env bash
#
# @file ansible.sh
# @brief to use ansible with vagrant for testing installation or make install with ansible playbook


# @description install ansible
#
# @noargs
function install_ansible(){
    if  [[ "$UID" -gt 0 ]]; then
        sudo apt-get install ansible
    else
        apt-get install ansible
    fi
}