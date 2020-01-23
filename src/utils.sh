#!/usr/bin/env bash
#
# @file utils.sh
# @brief file containing the utils function for the project and other


# @description change the source.list with template in /etc 
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
function generate_apt_list_ubuntu(){
    ../etc/source.list | tee /etc/apt/source.list
    return 0
}

# @description check if the system is a WSL
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
function checkWSL() {
    if [ -n "$WSL_DISTRO_NAME" ]; then
        return 0
    fi
    return 1
}


# @description check if the packages exist
#
# @args $1 package name
# @exitcode 0 If installed
# @exitcode 1 if not installed
function check_packages_install(){
    output=$(dpkg-query -W -f='${Status}' "$1" | grep -q -P '^install ok installed$'; echo "$?")
    return "$output"
}

# @description apt-get update
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
function aptupdate(){
    apt-get -qq update & apt-get install -f && apt-get autoclean
    return 0
}


# @description apt-get upgrade all
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
function aptupgrade(){
    apt-get -qq update && apt-get -q upgrade && apt-get -q dist-upgrade && apt-get -q install -f && apt-get -q autoclean
    return 0
}


# @description apt-get autoclean
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
function aptclean(){
    apt-get -q install -f && apt-get -q autoclean && sudo apt-get -y -q autoremove
    return 0
}

# @description check for args for a function
#
# @args $@ args
# @exitcode 0 If successfull.
# @exitcode 1 On failure
function check_args(){
    if [[ "$#" -eq 0 ]]; then
        return 1;
    fi
    return 0;
}

# @description check if the user is root then execute the command 
#
# @arg $1 a bash command 
# @exitcode 0 If successfull.
# @exitcode 1 On failure
function check_root(){
    if [[ "$(check-args $#)" -eq 0 ]]; then
        SUDO=''
        if [[ "$UID" -gt 0  ]]; then
            SUDO='sudo'
        fi
        "$SUDO" "$1"
        return 0
    fi
    return 1

}

# @description check if the user is root then execute the bash func 
#
# @arg $1 a bash func
# @exitcode 0 If successfull.
# @exitcode 1 On failure
function check_root_func(){
    if  [[ "$(check-args $#)" -eq 0 ]]; then
        SUDO=''
        if  [[ "$UID" -gt 0 ]]; then
            SUDO='sudo'
        fi
        # shellcheck disable=SC2086
        $SUDO bash -c "$(declare -f ${1}); ${1}"
        return 0
    fi
    return 1

}


# @description check mimetype of a file
# @arg $1 file
# @exitcode 0 If successfull.
# @exitcode 1 On failure
function get_mimetype(){
  file --mime-type "$1" | sed 's/.*: //' 
  return 0
}

# @description send mail locally with heirloom-mailx
# @arg $1 email from
# @arg $2 email to
# @arg $3 email subject
# @arg $4 email body
# @arg $5 email attachement file
# @exitcode 0 If successfull.
# @exitcode 1 On failure
function send_email() {
    # from="$1"
    to="$2"
    subject="$3"
    body="$4"
    attachment=$5

    echo "$body" | mutt -s "$subject" -a "$attachment" "$to" 
    return 0
}

# @description multiline string echo on each line with line number
#
# @arg $1 multiline string
# @exitcode 0 If successfull.
# @exitcode 1 On failure
function multiline_string_newline_to_array(){
    names="$1"

    SAVEIFS=$IFS   # Save current IFS
    IFS=$'\n'      # Change IFS to new line
    names=($names) # split to array $names
    IFS=$SAVEIFS   # Restore IFS

    for (( i=0; i<${#names[@]}; i++ ))
    do
        echo "$i: ${names[$i]}"
    done

    return 0
}

# @description read config file
# https://unix.stackexchange.com/questions/175648/use-config-file-for-my-shell-script
# @arg $1 the config fiel path
# @exitcode 0 If successfull.
# @exitcode 1 On failure
function config_read_file() {
    (grep -E "^${2}=" -m 1 "${1}" 2>/dev/null || echo "VAR=__UNDEFINED__") | head -n 1 | cut -d '=' -f 2-;
    return 0
}

# @description get config var from a spefic file
# https://unix.stackexchange.com/questions/175648/use-config-file-for-my-shell-script
# @arg $1 the config file path
# @arg $2 the config file var
# @exitcode 0 If successfull.
# @exitcode 1 On failure
function config_get() {
    # shellcheck disable=SC2086
    val="$(config_read_file ${1} ${2})";
    if [ "${val}" = "__UNDEFINED__" ]; then
        # shellcheck disable=SC2086
        val="$(config_read_file config.cfg.defaults ${2})";
    fi
    printf -- "%s" "${val}";
    return 0
}


# @description get timezone
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
function get_timezones() {
	TZ="$(cat /etc/timezone)"
    echo TZ
    return 0 
}

# @description check if the port is used
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
function check_command_exist() {
	if [[ $(command -v "$@") ]]; then
        return 0 
    else
        return 1
    fi
}


# @description check if the port is used
#
# @args $1 port number
# @exitcode 0 If successfull.
# @exitcode 1 On failure
function check_port(){
    if lsof -i:"$1" -P -n -t >/dev/null ; then
        return 0
    else
        return 1
    fi
}

# @description check if the port is used
#
# @args $# username of the user you want to add
# @exitcode 0 If successfull.
# @exitcode 1 On failure
function add_sudo(){
    while [[ -n $1 ]]; do
        usermod -aG sudo "$1"
        echo "$1    ALL=(ALL:ALL) ALL" >> /etc/sudoers;
        shift # shift all parameters;
    done
    return 0
}

# @description simple scp for downloading file for a remote dir scp/ssh
#
# @args $1 username@ip
# @args $2 file path on remote device
# @args $3 file path for the local device
# @exitcode 0 If successfull.
# @exitcode 1 On failure
function download_scp(){
    scp "$1":"$2" "$3"
    return 0
}

# @description simple scp for downloading file for a remote dir scp/ssh
#
# @args $1 file path for the local device
# @args $2 username@ip
# @args $3 file path on remote device
# @exitcode 0 If successfull.
# @exitcode 1 On failure
function upload_scp(){
    scp "$1" "$2":"$3"
    return 0
}

# @description simple scp for downloading file for a remote dir scp/ssh
#
# @args $1 file path for the local device
# @args $2 username@ip
# @args $3 file path on remote device
# @exitcode 0 If successfull.
# @exitcode 1 On failure
function chmod_sh_all(){
    echo "not implemented yet"
}


# @description check if the os is debian or ubuntu
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
function check_debian(){
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        # shellcheck source=/etc/os-release
        # shellcheck disable=SC1091
        source /etc/os-release
        if [[ $ID_LIKE == "debian" ]]; then
            return 0 
        fi
        return 1
    else
        echo "Please use this project on an Ubuntu or Debian system tested on (Ubuntu18.04)"
        return 1
    fi
}