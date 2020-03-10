#!/usr/bin/env bash
#
# @file install.sh
# @brief file containing the utils  for the project and other

# shellcheck source=src/menu.sh
# shellcheck disable=SC1091
source "$(dirname "${BASH_SOURCE[0]}")/src/menu.sh"

# Load the user defined parameters
while [[ $# -gt 0 ]]; do
    case "$1" in
        --help|*)
            cat docs/help.txt
        exit 1
        ;;
        esac
    shift
done

main_setup_menu