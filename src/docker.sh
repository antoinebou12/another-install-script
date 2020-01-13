#!/bin/bash
#
# @file Title of file script
# @brief Small description of the script.

# import 
source func-lib.sh


# @description install the docker
#
# @noargs
function install-docker(){
    apt-get remove docker docker-engine docker.io containerd runc
}

function install-docker-compose(){
    curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
}

function install-extra-docker(){
    curl -sSf https://moncho.github.io/dry/dryup.sh |  sh
}

