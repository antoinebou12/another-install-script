#!/bin/bash
#
# @file Title of file script
# @brief Small description of the script.


# @description check for args for a function
#
# @noargs
# @exitcode 0  If successfull.
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
# @exitcode 0  If successfull.
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
# @arg $1 a bash command 
# @exitcode 0  If successfull.
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


# @description check if the user is root then execute the bash func 
# warning: assumes that the passed file exists
# @arg $1 file
# @exitcode 0  If successfull.
# @exitcode 1 On failure
function get_mimetype(){
  file --mime-type "$1" | sed 's/.*: //' 
  return 0
}

function send_email() {}
from="sender@example.com"
to="recipient@example.org"
subject="Some fancy title"
body="This is the body of our email"
declare -a attachments
attachments=( "foo.pdf" "bar.jpg" "archive.zip" )
 
declare -a attargs
for att in "${attachments[@]}"; do
  attargs+=( "-a"  "$att" )  
done
 
mail -s "$subject" -r "$from" "${attargs[@]}" "$to" <<< "$body"
return 0