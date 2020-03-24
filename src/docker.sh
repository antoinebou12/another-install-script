#!/usr/bin/env bash
#
# @file docker.sh
# @brief to install docker docker compose on ubuntu18.04

# import

# shellcheck source=config.sh
# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/config.sh"
# shellcheck source=utils.sh
# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/utils.sh"

# @description install the docker
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
install_docker() {
    echo "Install Docker"
    print_line
    aptremove docker
    aptremove docker-engine
    aptremove docker.io
    aptremove containerd
    aptremove runc
    curl https://get.docker.com/ | exec_root sh > /dev/null
    aptclean

    print_line
    return 0
}

# @description install the docker compose
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
install_docker_compose() {
    echo "Install Docker Compose"
    print_line

    exec_root curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    exec_root chmod +x /usr/local/bin/docker-compose
    #ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

    print_line
    return 0
}

# @description install the docker extra utils dry
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
install_docker_extra() {
    echo "Install Docker Extra"
    print_line

    curl -sSf https://moncho.github.io/dry/dryup.sh | exec_root sh
    exec_root "chmod 755 /usr/local/bin/dry"

    sudo wget https://github.com/bcicen/ctop/releases/download/v0.7.3/ctop-0.7.3-linux-amd64 -O /usr/local/bin/ctop
    sudo chmod +x /usr/local/bin/ctop
    print_line

    return 0
}

# @description this  creates the volumes, services and backup directories. It then assisgns the current user to the ACL to give full read write access
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
udocker_create_default_dir() {
    echo "Create Folder for Docker User"
    print_line

    [ -d /home/udocker/config ] || udocker_create_dir /home/udocker/config
    [ -d /home/udocker/services ] || udocker_create_dir /home/udocker/services
    [ -d /home/udocker/volumes ] || udocker_create_dir /home/udocker/volumes
    [ -d /home/udocker/backups ] || udocker_create_dir /home/udocker/backups
    [ -d /home/udocker/downloads ] || udocker_create_dir /home/udocker/downloads
    [ -d /home/udocker/tvshows ] || udocker_create_dir /home/udocker/tv
    [ -d /home/udocker/movies ] || udocker_create_dir /home/udocker/movies
    [ -d /home/udocker/media ] || udocker_create_dir /home/udocker/media
    [ -d /home/udocker/audio ] || udocker_create_dir /home/udocker/audio
    [ -d /home/udocker/music ] || udocker_create_dir /home/udocker/audio

    print_line
    return 0
}

# @description create docker user and current user in the group and create dir
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_user() {
    echo "Create Docker User"
    print_line

    if read_config_yml system_udocker_username; then
        local UDOCKER="$(read_config_yml system_udocker_username)"
        local UDOCKER="${UDOCKER//\"/}"
        local UDOCKER_PASSWORD="$(read_config_yml system_udocker_password)"
        local UDOCKER_PASSWORD="${UDOCKER//\"/}"
    else
        local UDOCKER="udocker"
        local UDOCKER_PASSWORD="udocker"
    fi

    if id -u "$UDOCKER" >/dev/null 2>&1; then
        echo "The user $UDOCKER already exist"
    else
        exec_root "adduser --disabled-password --gecos '' $UDOCKER"
        echo "$UDOCKER:$UDOCKER_PASSWORD" | exec_root chpasswd
        exec_root usermod -aG docker "$UDOCKER"
        add_sudo "$UDOCKER"
        udocker_create_default_dir
    fi

    grep -qxF "UDOCKER=\"$UDOCKER\"" /etc/environment || echo "UDOCKER=\"$UDOCKER\"" | exec_root tee -a /etc/environment
    grep -qxF "UDOCKER_ROOT=\"/home/$UDOCKER/volumes\"" /etc/environment || exec_root echo "UDOCKER_ROOT=\"/home/$UDOCKER/volumes\"" | exec_root tee -a /etc/environment
    grep -qxF "UDOCKER_USERID=\"$(id -u $UDOCKER)\"" /etc/environment || exec_root echo "UDOCKER_USERID=\"$(id -u $UDOCKER)\"" | exec_root tee -a /etc/environment
    grep -qxF "UDOCKER_GROUPID=\"$(id -g $UDOCKER)\"" /etc/environment || exec_root echo "UDOCKER_GROUPID=\"$(id -g $UDOCKER)\"" | exec_root tee -a /etc/environment
    grep -qxF "TZ=\"$(cat /etc/timezone)\"" /etc/environment || exec_root echo "TZ=\"$(cat /etc/timezone)\"" | exec_root tee -a /etc/environment


    print_line
    return 0
}

# @description Remove docker user
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_user() {
    echo "Remove Docker User"
    print_line
    if read_config_yml system_udocker_username; then
        local UDOCKER="$(read_config_yml system_udocker_username)"
        local UDOCKER="${UDOCKER//\"/}"
    else
        local UDOCKER="udocker"
    fi
    if id -u "$UDOCKER" >/dev/null 2>&1; then
        exec_root deluser --remove-home "$UDOCKER" >/dev/null
        exec_root sed -i '/UDOCKER/d' /etc/environment
    else
        echo "The user $UDOCKER doesn't exist"
    fi
    print_line
    return 0
}

# @description do as the docker user
#
# @args $1 command or function with no argument
# @args $1 function file location
# @exitcode 0 If successfull.
# @exitcode 1 On failure
do_as_udocker_user() {

    if read_config_yml system_udocker_username; then
        local UDOCKER="$(read_config_yml system_udocker_username)"
        local UDOCKER="${UDOCKER//\"/}"
        local UDOCKER_PASSWORD="$(read_config_yml system_udocker_password)"
        local UDOCKER_PASSWORD="${UDOCKER//\"/}"
    else
        local UDOCKER="udocker"
        local UDOCKER_PASSWORD="udocker"
    fi

    if typeset -f "$1" >/dev/null; then
        export -f "$1"
        echo "sudo su $UDOCKER -c \"bash -c $1\""
        echo "$UDOCKER_PASSWORD" | su -l "$UDOCKER" -c "source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/$2";export -f $1; $1"
    else
        echo "su -l "$UDOCKER" $@"
        echo "$UDOCKER_PASSWORD" | su -l "$UDOCKER" -c "$@"
    fi
    return 0
}



# @description create udocker dir
#
# @args $1 directory path
# @exitcode 0 If successfull.
# @exitcode 1 On failure
udocker_create_dir() {
    exec_root mkdir -p "$1"
    exec_root chmod 755 "$1"
    if read_config_yml system_udocker_username; then
        exec_root chown "$(read_config_yml system_udocker_username)":"$(read_config_yml system_udocker_username)" "$1"
    else
        exec_root chown udocker:udocker "$1"
    fi
}

# @description prune all the volumes and images
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
prune_containers_volumes_all() {
    echo "Prune all Docker Images and Volumes"
    print_line

    docker image prune -a
    docker system prune

    print_line
    return 0
}
