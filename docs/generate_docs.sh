#!/bin/bash

 install_shdoc(){
    cd .. || return 1
    git submodule update --init --recursive
    git pull --recurse-submodules
    cd docs || return 1
}


 use_shdoc(){
    names=$(find ../ -type d \( -path ../tests/coverage -o -path ../tests/bin -o -path ../etc -o -path ../docs \) -prune -o -iname "*.sh" -print)

    SAVEIFS="$IFS"   # Save current IFS
    IFS=$'\n'      # Change IFS to new line
    names=($names) # split to array $names
    IFS="$SAVEIFS"   # Restore IFS

    [[ -f "$1" ]] && rm -rf "$1"
    [[ -d vendor/reconquest/shdoc/ ]] || install_shdoc

    for (( i=0; i<${#names[@]}; i++ )); do
        echo "$i: ${names[$i]}"
        vendor/reconquest/shdoc/shdoc < ${names[$i]} >> "$1"
    done

    return 0
}

use_shdoc "$1"

