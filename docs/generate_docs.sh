#!/bin/bash

function use_shdoc(){
    names=$(find ../src -iname "*.sh")

    SAVEIFS=$IFS   # Save current IFS
    IFS=$'\n'      # Change IFS to new line
    names=($names) # split to array $names
    IFS=$SAVEIFS   # Restore IFS

    for (( i=0; i<${#names[@]}; i++ ))
    do
        vendor/shdoc/shdoc < ${names[$i]} > $1
        echo "$i: ${names[$i]}"
    done

    return 0
}

use_shdoc $1

