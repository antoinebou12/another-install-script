#!/usr/bin/env bash
#
# @file install.sh
# @brief file containing the utils  for the project and other

source "$(dirname "${BASH_SOURCE[0]}")/src/menu.sh"

# Load the user defined parameters
while [[ $# > 0 ]]; do
    case "$1" in
        --help|*)
            cat docs/help.txt
        exit 1
        ;;
        esac
    shift
done


main_setup_menu