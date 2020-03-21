#!/usr/bin/env bash
#
# @file vagrant.sh
# @brief vagrant utils functions

# @description start_create linux vm
#
# @args $1 vagrant box code name 
# @exitcode 0 If successfull.
# @exitcode 1 On failure
vagrant_create() {
    pushd "$1" || exit
    vagrant up
    vagrant ssh
    popd || exit
}

# @description destroy vagrant vm
#
# @args $1 vagrant box code name 
# @exitcode 0 If successfull.
# @exitcode 1 On failure
vagrant_ssh() {
    pushd "$1" || exit
    vagrant destroy -f
    popd || exit
}

# @description ssh vagrant vm
#
# @args $1 vagrant box code name 
# @exitcode 0 If successfull.
# @exitcode 1 On failure
vagrant_ssh() {
    pushd "$1" || exit
    vagrant ssh
    popd || exit
}

while [[ $# -gt 0 ]]; do
    case "$1" in
    create)
        vagrant_create "$2"
        exit 1
        ;;
    destroy)
        vagrant_ssh "$2"
        exit 1
        ;;
    destroy)
        vagrant_destroy "$2"
        exit 1
        ;;
    esac
    shift
done
