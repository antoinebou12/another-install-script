#!/usr/bin/env bash

# @file keycloak.sh
# @brief to install docker keycloak



# @description create docker keycloak
# not implemented yet
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_keycloak(){
    docker run --name keycloak -p 8050:8080 -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=password jboss/keycloak
    return 1
}