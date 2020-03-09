#!/usr/bin/env bash
#
# @file install.sh
# @brief install my favirote packages for ubuntu18.04 and tested

# import

# shellcheck source=utils.sh
# shellcheck disable=SC1091
source "$(dirname "${BASH_SOURCE[0]}")/utils.sh"

# @description change the source.list with template in /etc
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
generate_apt_list_ubuntu() {
    echo "Create Curated apt list"
    print_line

    ../etc/source.list | tee /etc/apt/source.list

    print_line
    return 0
}

# @description install the basic package to ubuntu I personnally like
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
install_basic() {
    echo "Install the basic packages"
    print_line

    dist_check

    aptupdate
    aptupgrade
    aptinstall nmap wget curl bats mlocate python python-pip python3 python3-pip wireless-tools wpasupplicant git cmake build-essential default-jre jq net-tools openssl firefox

    print_line
    return 0
}

# @description install the cockpit to web
# See your server in a web browser and perform system tasks with a mouse. It’s easy to start containers, administer storage, configure networks, and inspect logs.
# https://cockpit-project.org/
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
install_cockpit() {
    echo "Install Cockpit"
    print_line

    aptupdate
    aptinstall cockpit cockpit-docker cockpit-machines cockpit-packagekit
    if [[ "$(checkWSL arg)" != "0" ]]; then
        exec_root systemctl restart cockpit
    fi

    print_line
    return 0
}

# @description install ansible
#  https://www.ansible.com
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
install_ansible() {
    echo "Install Ansible"
    print_line

    exec_root apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
    aptupdate
    aptinstall ansible software-properties-common
    exec_root pip install ansible

    print_line
    return 0
}

# @description install the cockpit to web
#
# https://github.com/mrowa44/emojify
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
install_emojify() {
    echo "Install Emojify"
    print_line
    if [[ "$UID" -gt 0 ]]; then
        sudo sh -c "curl https://raw.githubusercontent.com/mrowa44/emojify/master/emojify -o /usr/local/bin/emojify && chmod +x /usr/local/bin/emojify"
    else
        sh -c "curl https://raw.githubusercontent.com/mrowa44/emojify/master/emojify -o /usr/local/bin/emojify && chmod +x /usr/local/bin/emojify"
    fi
    print_line
    return 0
}

# @description manage install menu
#
# @args $1 SETUP_INSTALL_MENU
# @exitcode 0 If successfull.
# @exitcode 1 On failure
manage_exec_install_list() {
    local FUNC_INSTALL="install_"
    basic_option=()
    mapfile -t basic_option <<<"$1"
    for basic in "${basic_option[@]}"; do
        if [[ "$basic" == "docker" ]]; then
            install_docker
            install_docker_compose
            create_docker_user
        else
            "$FUNC_INSTALL""$basic"
        fi
    done
    return 0
}
