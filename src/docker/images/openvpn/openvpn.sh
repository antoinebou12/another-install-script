#!/usr/bin/env bash
#
# @file openvpn.sh
# @brief to install docker openvpn


# @description create docekr openvpn
# https://github.com/kylemanna/docker-openvpn
# @exitcode 0 If successfull.
# @exitcode 1 On failure
 create_docker_openvpn(){
    
    udocker_create_dir /home/udocker/volumes/openvpn

    docker-compose run --rm openvpn ovpn_genconfig -u udp://"$(get_current_ip)"
    docker-compose run --rm openvpn ovpn_initpki
    docker-compose run --rm openvpn easyrsa build-client-full user nopass
    docker-compose run --rm openvpn ovpn_getclient user > user.ovpn
    docker-compose up -d openvpn
    return 0
}


