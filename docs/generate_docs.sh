#!/bin/bash

function use_shdoc(){
    names=$(find ../ -type d \( -path ../tests/coverage -o -path ../tests/bin -o -path ../etc -o -path ../docs \) -prune -o -iname "*.sh" -print)

    SAVEIFS=$IFS   # Save current IFS
    IFS=$'\n'      # Change IFS to new line
    names=($names) # split to array $names
    IFS=$SAVEIFS   # Restore IFS
    
    rm -rf $1

    for (( i=0; i<${#names[@]}; i++ )); do
        vendor/shdoc/shdoc < ${names[$i]} >> $1
        echo "$i: ${names[$i]}"
    done

    return 0
}

use_shdoc $1

