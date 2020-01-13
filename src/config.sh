#!/bin/bash


# https://unix.stackexchange.com/questions/175648/use-config-file-for-my-shell-script
function init-config(){
    typeset -A config # init array
    config=( # set default values in config array
        [username]="root"
        [password]=""
    )

    while read line
    do
        if echo $line | grep -F = &>/dev/null
        then
            varname=$(echo "$line" | cut -d '=' -f 1)
            config[$varname]=$(echo "$line" | cut -d '=' -f 2-)
        fi
    done < ../etc/config.config

    echo ${config[username]} # should be loaded from defaults
    echo ${config[password]} # should be loaded from config file
    return config
}