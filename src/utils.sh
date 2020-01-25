#!/usr/bin/env bash
#
# @file utils.sh
# @brief file containing the utils  for the project and other


# @description print line ======
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
print_line(){
    printf "%0$(tput cols)d" 0 | tr '0' '='
    return 0
}

# @description print ascii art
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
show_project_name() {
    print_line
    cat <<EOF

    ___                   __   __               
   /   |   ____   ____   / /_ / /_   ___   _____
  / /| |  / __ \ / __ \ / __// __ \ / _ \ / ___/
 / ___ | / / / // /_/ // /_ / / / //  __// /    
/_/  |_|/_/ /_/ \____/ \__//_/ /_/ \___//_/     
                                                

    ____              __          __ __
   /  _/____   _____ / /_ ____ _ / // /
   / / / __ \ / ___// __// __  // // / 
 _/ / / / / /(__  )/ /_ / /_/ // // /  
/___//_/ /_//____/ \__/ \____//_//_/   


   _____              _         __ 
  / ___/ _____ _____ (_)____   / /_
  \__ \ / ___// ___// // __ \ / __/
 ___/ // /__ / /   / // /_/ // /_  
/____/ \___//_/   /_// ____/ \__/  
                    /_/           
EOF
    print_line
    return 0
}

# @description check if the system is a WSL
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
checkWSL() {
    if [ -n "$WSL_DISTRO_NAME" ]; then
        return 0
    fi
    return 1
}

# @description check for args for a
#
# @args $@ args
# @exitcode 0 If successfull.
# @exitcode 1 On failure
check_args() {
    if [[ "$#" -eq 0 ]]; then
        return 1
    fi
    return 0
}

# @description check root user
#
# @arg $1 a bash command
# @exitcode 0 If successfull.
# @exitcode 1 On failure
check_root() {
    if [[ "$UID" -gt 0 ]]; then
        return 1
    else
        return 0
    fi
}

# @description check if the user is root then execute the command
#
# @arg $1 a bash command
# @exitcode 0 If successfull.
# @exitcode 1 On failure
exec_root() {
    if [[ ! "$#" -eq 0 ]]; then
        SUDO=''
        if [[ "$UID" -gt 0 ]]; then
            SUDO='sudo'
        fi
        echo "$SUDO $1"
        $SUDO $1
        return 0
    fi
    return 1

}

# @description check if the user is root then execute the bash func
#
# @arg $1 a bash func
# @exitcode 0 If successfull.
# @exitcode 1 On failure
exec_root_func() {
    if [[ ! "$#" -eq 0 ]]; then
        SUDO=''
        if [[ "$UID" -gt 0 ]]; then
            SUDO='sudo'
        fi
        # shellcheck disable=SC2086
        $SUDO bash -c "$(declare -f ${1}); ${1}"
        return 0
    fi
    return 1

}

# @description check if the packages exist
#
# @args $1 package name
# @exitcode 0 If installed
# @exitcode 1 if not installed
check_packages_install() {
    output=$(
        dpkg-query -W -f='${Status}' "$1" | grep -q -P '^install ok installed$'
        echo "$?"
    )
    return "$output"
}

# @description apt-get update
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
aptupdate() {
    echo "apt update"
    exec_root "apt-get -qq update" > /dev/null
    exec_root "apt-get -qq install -f" > /dev/null
    exec_root "apt-get -qq autoclean" > /dev/null
    return 0
}

# @description apt-get upgrade all
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
aptupgrade() {
    echo "apt upgrade"
    exec_root "apt-get -qq update" > /dev/null
    exec_root "apt-get -qq upgrade" > /dev/null
    exec_root "apt-get -qq dist-upgrade"  > /dev/null
    exec_root "apt-get -qq install -f"  > /dev/null
    exec_root "apt-get -qq autoclean" > /dev/null
    return 0
}

# @description apt-get install package
#
# @args $@ packages to install
# @exitcode 0 If successfull.
# @exitcode 1 On failure
aptinstall() {
    echo "apt install"
    aptupdate > /dev/null
    exec_root "apt-get -qq install -y $@" > /dev/null
    return 0
}

# @description apt-get install package
#
# @args $@ packages to remove
# @exitcode 0 If successfull.
# @exitcode 1 On failure
aptremove() {
    echo "apt remove"
    aptupdate > /dev/null
    exec_root "apt-get -qq remove -y $@" > /dev/null
    return 0
}

# @description apt-get autoclean
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
aptclean() {
    echo "apt clean"
    exec_root "apt-get -qq install -f" > /dev/null
    exec_root "apt-get -qq autoclean -y" > /dev/null
    exec_root "apt-get -qq autoremove -y" > /dev/null
    return 0
}

# @description check mimetype of a file
# @arg $1 file
# @exitcode 0 If successfull.
# @exitcode 1 On failure
get_mimetype() {
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
send_email() {
    # from="$1"
    local to="$2"
    local subject="$3"
    local body="$4"
    local attachment=$5

    echo "$body" | mutt -s "$subject" -a "$attachment" "$to"
    return 0
}

# @description read config file
# https://unix.stackexchange.com/questions/175648/use-config-file-for-my-shell-script
# @arg $1 the config fiel path
# @exitcode 0 If successfull.
# @exitcode 1 On failure
config_read_file() {
    (grep -E "^${2}=" -m 1 "${1}" 2>/dev/null || echo "VAR=__UNDEFINED__") | head -n 1 | cut -d '=' -f 2-
    return 0
}

# @description get config var from a spefic file
# https://unix.stackexchange.com/questions/175648/use-config-file-for-my-shell-script
# @arg $1 the config file path
# @arg $2 the config file var
# @exitcode 0 If successfull.
# @exitcode 1 On failure
config_get() {
    # shellcheck disable=SC2086
    val="$(config_read_file ${1} ${2})"
    if [ "${val}" = "__UNDEFINED__" ]; then
        # shellcheck disable=SC2086
        val="$(config_read_file config.cfg.defaults ${2})"
    fi
    printf -- "%s" "${val}"
    return 0
}

# @description get timezone
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
get_timezones() {
    TZ="$(cat /etc/timezone)"
    echo TZ
    export TZ
    return 0
}

# @description check if the port is used
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
check_command_exist() {
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
check_port() {
    if exec_root "lsof -i:$1 -P -n -t >/dev/null"; then
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
add_sudo() {
    while [[ -n $1 ]]; do
        exec_root "usermod -aG sudo $1"
        exec_root "echo '$1    ALL=(ALL:ALL) ALL' >>/etc/sudoers"
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
download_scp() {
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
upload_scp() {
    scp "$1" "$2":"$3"
    return 0
}

# @description simple scp for downloading file for a remote dir scp/ssh
#
# @args $1 path to folder
# @exitcode 0 If successfull.
# @exitcode 1 On failure
chmod_sh_all() {
    find $1 -name "*.sh" -execdir chmod u+x {} +
}

# @description loop find files func
#
# @args $1 path to folder
# @args $2 regex of files
# @args $3 func
# @exitcode 0 If successfull.
# @exitcode 1 On failure
loop_files_func() {
    local names=$(find "$1" -name "$2")

    local SAVEIFS="$IFS" # Save current IFS
    local IFS=$'\n'      # Change IFS to new line
    local names=($names) # split to array $names
    local IFS="$SAVEIFS" # Restore IFS

    for ((i = 0; i < ${#names[@]}; i++)); do
        echo "$i: ${names[$i]}"
        $3 "${names[$i]}"
    done

    return 0
}

# @description check if the os is debian or ubuntu
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
check_debian() {
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

# @description check the ip of the server
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
get_current_ip() {
    PUBLIC_IP=$(curl -s https://ipinfo.io/ip)
    export PUBLIC_IP
    echo $PUBLIC_IP
}

# @description check the geolocation based on ip of the server
# https://www.howtogeek.com/405088/how-to-get-your-systems-geographic-location-from-a-bash-script/
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
get_geolocation() {
    get_current_ip
    curl -s https://ipvigilante.com/${PUBLIC_IP} | jq '.data.latitude, .data.longitude, .data.city_name, .data.country_name' |
        while read -r LATITUDE; do
            read -r LONGITUDE
            read -r CITY
            read -r COUNTRY
            echo "${LATITUDE},${LONGITUDE},${CITY},${COUNTRY}" | tr --delete \" /etc/server_geolocation.txt
        done

    #cp geolocate.sh /etc/cron.daily
}
