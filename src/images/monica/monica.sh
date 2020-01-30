#!/usr/bin/env bash

# @file monica.sh
# @brief to install docker monica



# @description create docker monica
# not implemented yet
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_monica(){
    docker run -d -p 8054:80 monicahq/monicahq
    echo "not implemented yet"
    return 1
}