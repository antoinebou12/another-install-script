#!/usr/bin/env bash
#
# @file backup.sh
# @brief backup list of fucntion

# shellcheck source=utils.sh
# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/utils.sh"
# shellcheck source=config.sh
# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/config.sh"

# @description create tar for running docker for a local backup
#
# @args $1 container id
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_container_id_backup() {
    echo "Create Docker Container Backup $1"
    print_line

    # shellcheck disable=SC2086,SC2143
    if [ ! "$(docker ps -a | grep $1)" ]; then
        container_name="$(docker ps | grep $1 | awk '{ print $2 }')"
        date_id="$(date +'%m/%d/%Y_%s')"
        container_backup="${container_name}_${date_id}_backup"
        docker commit -p "$1" "$container_backup"
        docker save -o /home/udocker/backups/"$container_backup".tar "$container_backup"
    fi

    print_line
    return 0
}

# @description create tar for running docker for a local backup
#
# @args $1 container container name
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_container_name_backup() {
    echo "Create Docker Container Backup $1"
    print_line

    # shellcheck disable=SC2086,SC2143
    if [ ! "$(docker ps -a | grep $1)" ]; then
        # shellcheck disable=SC2086
        container_name="$(docker ps | grep $1 | awk '{ print $1 }')"
        date_id=$(date +'%m/%d/%Y_%s')
        container_backup="${container_name}_${date_id}_backup"
        docker commit -p "$1" "$container_backup"
        docker save -o /home/udocker/backups/"$container_backup".tar "$container_backup"
    fi

    print_line
    return 0
}

# @description make a backup of all the container
#
# @args $# the backup of all the container names
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_container_backup_all() {
    while [[ -n $1 ]]; do
        create_container_name_backup "$1"
        shift # shift all parameters;
    done
    return 0
}

# @description full backup of system
#
# @args $1 location of the backup work with ssh
# @exitcode 0 If successfull.
# @exitcode 1 On failure
full_backup_system() {
    exec_root rsync -aAXv / --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} "$1"
}
