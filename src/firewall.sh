#!/usr/bin/env bash
#
# @file firewall.sh
# @brief to manage the open port in the firewall

# @description enable firewall
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
enable_firewall() {
    exec_root snap install ufw
    exec_root ufw default deny incoming
    exec_root ufw default allow outgoing
    exec_root ufw allow ssh
    exec_root ufw enable
    return 0
}

# @description disable firewall
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
disable_firewall() {
    exec_root ufw disable
    return 0
}

# @description allow a port in the firewall
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
allow_port_in_firewall() {
    exec_root ufw allow "$1"
    return 0
}

# @description deny a port in the firewall
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
deny_port_in_firewall() {
    exec_root ufw allow "$1"
    return 0
}
