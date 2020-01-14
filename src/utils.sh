#!/usr/bin/env bash
#
# @file utils.sh
# @brief file containing the utils function for the project and other


# @description check if the packages exist
#
# @args $1 package name
# @exitcode 0 If installed
# @exitcode 1 if not installed
function check_packages_install(){
    return dpkg-query -W -f='${Status}' $1 2>/dev/null | grep -q -P '^install ok installed$'; echo $?
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
    apt-get -q install -f && apt-get -q autoclean 
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
# @arg $1 a bash func
# @exitcode 0 If successfull.
# @exitcode 1 On failure
function check_root_func(){
    if  [[ "$(check-args $#)" -eq 0 ]]; then
        SUDO=''
        if (( $EUID != 0 )); then
            SUDO='sudo'
        fi
        $SUDO bash -c "$(declare -f $1); $1"
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
    from="$1"
    to="$2"
    subject="$3"
    body="$4"
    declare -a attachments
    attachments=( $5 )
 
    declare -a attargs
    for att in "${attachments[@]}"; do
        attargs+=( "-a"  "$att" )  
    done
    
    mail -s "$subject" -r "$from" "${attargs[@]}" "$to" <<< "$body"
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

# @description change the source.list with template in /etc 
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
function generate_apt_list_ubuntu(){
    cat ../etc/source.list | tee /etc/apt/source.list
    return 0
}

# @description read config file
# https://unix.stackexchange.com/questions/175648/use-config-file-for-my-shell-script
# @arg $1 the config fiel path
# @exitcode 0 If successfull.
# @exitcode 1 On failure
config_read_file() {
    (grep -E "^${2}=" -m 1 "${1}" 2>/dev/null || echo "VAR=__UNDEFINED__") | head -n 1 | cut -d '=' -f 2-;
    return 0
}

# @description change the source.list with template in /etc 
# https://unix.stackexchange.com/questions/175648/use-config-file-for-my-shell-script
# @arg $1 the config file path
# @arg $2 the config file var
# @exitcode 0 If successfull.
# @exitcode 1 On failure
config_get() {
    val="$(config_read_file $1 "${2}")";
    if [ "${val}" = "__UNDEFINED__" ]; then
        val="$(config_read_file config.cfg.defaults "${2}")";
    fi
    printf -- "%s" "${val}";
    return 0
}