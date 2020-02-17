#!/usr/bin/env bash
#
# @file openvpn.sh
# @brief to install docker openvpn


# @description create docekr openvpn
# https://github.com/kylemanna/docker-openvpn
# @exitcode 0 If successfull.
# @exitcode 1 On failure
 create_docker_openvpn(){
    
    exec_root docker-compose run --rm openvpn ovpn_genconfig -u udp://"$(get_current_ip)"
    exec_root docker-compose run --rm openvpn ovpn_initpki
    exec_root docker-compose run --rm openvpn easyrsa build-client-full user nopass
    exec_root docker-compose run --rm openvpn ovpn_getclient user > user.ovpn
    exec_root docker-compose up -d openvpn
    return 0
}


