#!/usr/bin/env bash
#
# @file linter.sh
# @brief shellcheck for all the bash script


function shellcheck_all(){
    names=$(find ../ -type d \( -path ../tests/coverage -o -path ../tests/bin -o -path ../etc \) -prune -o -iname "*.sh" -print)

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

function install_shellcheck(){
    if [[ $(command -v shellcheck) ]]; then
        if  [[ "$UID" -gt 0 ]]; then
            sudo apt-get install shellcheck
        else
            apt-get install shellcheck
        fi
    fi
}

shellcheck_all