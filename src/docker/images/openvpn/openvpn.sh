#!/usr/bin/env bash
#
# @file openvpn.sh
# @brief to install docker openvpn


# @description create docekr openvpn
# https://github.com/kylemanna/docker-openvpn
# @args $1 the vps or server domain or ip
# @args $2 clientname that use the openvpn
# @exitcode 0 If successfull.
# @exitcode 1 On failure
function create_docker_openvpn(){
    docker-compose run --rm openvpn ovpn_genconfig -u udp://$1
    docker-compose run --rm openvpn ovpn_initpki
    docker-compose run --rm openvpn easyrsa build-client-full $2 nopass
    docker-compose run --rm openvpn ovpn_getclient $2 > $2.ovpn
    docker-compose up -d openvpn
    return 0
}


