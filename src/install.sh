#!/usr/bin/env bash
#
# @file install.sh
# @brief install my favirote packages for ubuntu18.04 and tested

# import

# shellcheck source=config.sh
# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/config.sh"
# shellcheck source=firewall.sh
# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/firewall.sh"
# shellcheck source=utils.sh
# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/utils.sh"

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
    aptinstall nmap wget curl bats mlocate python3 python3-pip wireless-tools wpasupplicant git cmake build-essential default-jre jq net-tools openssl firefox

    print_line
    return 0
}


# @description install lxde-core Desktop Environment
# https://kde.org/plasma-desktop
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
install_lxde() {
    echo "Install lxde"
    print_line

    aptupdate
    aptinstall xorg openbox xauth || aptinstall xorg-server xorg-xinit xf86-input-keyboard xorg-xkbcomp xorg-twm xorg-xclock xterm || aptinstall X Window system
    aptinstall lxde-core

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
    if checkWSL && virt_check; then
        exec_root systemctl restart cockpit
    fi

    allow_port_in_firewall 9090

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
    exec_root pip3 install ansible

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
    exec_root sh -c "curl https://raw.githubusercontent.com/mrowa44/emojify/master/emojify -o /usr/local/bin/emojify && chmod +x /usr/local/bin/emojify"
    print_line
    return 0
}

# @description install the dokku
#
# https://github.com/dokku/dokku
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
install_dokku() {
    echo "Install Dokku"
    print_line
    wget https://raw.githubusercontent.com/dokku/dokku/v0.20.0/bootstrap.sh
    exec_root DOKKU_TAG=v0.20.0 bash bootstrap.sh
    print_line
    return 0
}

# @description install the lynk
#
# https://lynk.sh/docs
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
install_lynk() {
    echo "Install lynk"
    print_line
    curl https://dl.loopholelabs.io/releases/lynk/linux/0.0.1-alpha/x64/lynk.zip -o /tmp/lynk.zip && unzip /tmp/lynk.zip && rm -rf /tmp/lynk.zip
    exec_root mv lynk /usr/local/bin/lynk
    print_line
    return 0
}

# @description install the vagrant
#
# https://www.vagrantup.com/
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
install_vagrant() {
    echo "Install vagrant"
    print_line
    curl https://releases.hashicorp.com/vagrant/2.2.7/vagrant_2.2.7_linux_amd64.zip -o /tmp/vagrant.zip && unzip /tmp/vagrant.zip && rm -rf /tmp/vagrant.zip
    exec_root mv vagrant /usr/local/bin/vagrant
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
