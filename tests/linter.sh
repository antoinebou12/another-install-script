#!/usr/bin/env bash
#
# @file linter.sh
# @brief shellcheck for all the bash script

# @description use shellcheck on all bash script in project
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
 use_shellcheck(){
    names=$(find ../ -type d \( -path ../tests/coverage -o -path ../tests/bin -o -path ../etc -o -path /tmp -o -path ../docs/vendor \) -prune -o -iname "*.sh" -print)

    SAVEIFS=$IFS   # Save current IFS
    IFS=$'\n'      # Change IFS to new line
    names=($names) # split to array $names
    IFS=$SAVEIFS   # Restore IFS

    for (( i=0; i<${#names[@]}; i++ )); do
        echo "$i: ${names[$i]}"
        shellcheck "${names[$i]}"
    done

    return 0
}

# @description install shellcheck
# https://github.com/koalaman/shellcheck
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
 install_shellcheck(){
    if [[ ! $(command -v shellcheck) ]]; then
        if  [[ "$UID" -gt 0 ]]; then
            sudo apt-get install shellcheck
        else
            apt-get install shellcheck
        fi
    fi
    return 0
}

use_shellcheck