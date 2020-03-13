#!/usr/bin/env bash
#
# @file vagrant.sh
# @brief vagrant utils functions

# @description start_create ubuntu vm
#
# @args $1 vagrant ubuntu code name xenial64/eaon64
# @args $2 branch name
# @exitcode 0 If successfull.
# @exitcode 1 On failure
vagrant_create() {
    pushd "$1" || exit
    vagrant up && vagrant ssh <<EOF
git clone https://github.com/antoinebou13/another-install-script.git
cd another-install-script || exit
git checkout $2
EOF
    vagrant ssh
    popd || exit
}

# @description destroy vagrant
#
# @args $1 vagrantfile location
# @exitcode 0 If successfull.
# @exitcode 1 On failure
vagrant_destroy() {
    pushd "$1" || exit
    vagrant destroy -f
    popd || exit
}

while [[ $# -gt 0 ]]; do
    case "$1" in
    create)
        vagrant_create "$2" "$3"
        exit 1
        ;;
    destroy)
        vagrant_destroy "$2"
        exit 1
        ;;
    esac
    shift
done
