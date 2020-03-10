#!/usr/bin/env bash
#
# @file firewall.sh
# @brief to manage the open port in the firewall

# import
source "$(dirname "${BASH_SOURCE[0]}")/config.sh"
source "$(dirname "${BASH_SOURCE[0]}")/utils.sh"

# @description install firewall
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
install_firewall() {
    aptinstall ufw
    exec_root ufw default deny incoming
    exec_root ufw default allow outgoing
    allow_port_in_firewall ssh
    allow_port_in_firewall 2222
    allow_port_in_firewall http
    allow_port_in_firewall https
    enable_firewall
    return 0
}

# @description uninstalll firewall
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
uninstall_firewall() {
    if [[ $(check_packages_install ufw) ]]; then
        disable_firewall
        aptremove ufw
        return 0
    else
        return 0
    fi
}

# @description enable firewall
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
enable_firewall() {
    if [[ $(check_packages_install ufw) ]]; then
        exec_root ufw enable
        return 0
    else
        return 1
    fi
}

# @description disable firewall
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
disable_firewall() {
    if [[ $(check_packages_install ufw) ]]; then
        exec_root ufw disable
        return 0
    else
        return 1
    fi
}

# @description allow a port in the firewall
#
# @args $1 port to allow
# @exitcode 0 If successfull.
# @exitcode 1 On failure
allow_port_in_firewall() {
    if [[ $(check_packages_install ufw) ]]; then
        exec_root ufw allow "$1"
        return 0
    else
        return 1
    fi
}

# @description deny a port in the firewall
#
# @args $1 port to deny
# @exitcode 0 If successfull.
# @exitcode 1 On failure
deny_port_in_firewall() {
    if [[ $(check_packages_install ufw) ]]; then
        exec_root ufw deny "$1"
        return 0
    else
        return 1
    fi
}

# @description manage allow port based on installed containers
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
manage_firewall_ports_allow_list() {

    containers=()
    if [[ -f /home/udocker/config/containers.txt ]]; then
        mapfile -t containers <<<"$(cat/home/udocker/config/containers.txt)"
    elif [[ -f /tmp/containers.txt ]]; then
        mapfile -t containers <<<"$(cat /tmp/containers.txt)"
    fi

    for container_name in "${containers[@]}"; do
        echo "$(parse_yml_array "$container_name""_ports")"
        parse_yml_array "$container_name""_ports" >>/tmp/ports.txt
    done

    [ -d /home/udocker/ ] && cp /tmp/ports.txt /home/udocker/config/ports.txt

    ports=()
    if [[ -f /home/udocker/config/ports.txt ]]; then
        mapfile -t ports <<<"$(cat/home/udocker/config/ports.txt)"
    elif [[ -f /tmp/ports.txt ]]; then
        mapfile -t ports <<<"$(cat/tmp/ports.txt)"
    fi

    for port_numbers in "${ports[@]}"; do
        echo "allow $port_numbers"
        allow_port_in_firewall "$port_numbers"
    done

    if [[ "$(read_config_yml "system-config_firewall")" == "on" ]]; then
        enable_firewall
    else
        disable_firewall
    fi

    return 0
    print_line
}
