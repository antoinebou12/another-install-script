#!/bin/bash
#
# @file Title of file script
# @brief Small description of the script.


# @description check for args for a function
#
# @noargs
# @exitcode 0  If successfull.
# @exitcode 1 On failure
function check-args(){
    if [ "$#" -ne 1 ]; then
        return 1;
    fi
    return 0;
}

# @description check if the user is root then execute the command 
#
# @arg $1 a bash command 
# @exitcode 0  If successfull.
# @exitcode 1 On failure
function check-root(){
    if check-required-args $#; then
        SUDO=''
        if (( $EUID != 0 )); then
            SUDO='sudo'
        fi
        $SUDO $1
        return 0
    fi
    return 1

}

# @description check if the user is root then execute the bash func 
#
# @arg $1 a bash command 
# @exitcode 0  If successfull.
# @exitcode 1 On failure
function check-root-func(){
    if check-required-args $#; then
        SUDO=''
        if (( $EUID != 0 )); then
            SUDO='sudo'
        fi
        $SUDO bash -c "$(declare -f $1); $1"
        return 0
    fi
    return 1

}