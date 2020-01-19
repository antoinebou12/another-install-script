#!/bin/bash
#
# @file setup.sh
# @brief setup project

PROJECTDIRSETUP="$(dirname "$0")"

# @description create setup menu
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
function create_setup_menu(){
    
    setup_menu=$(whiptail --title "Main Menu" --menu --notags "" 20 78 12 -- \
	"install_simple" "Simple Installation" \
	"install_custom" "Custom Installation" \
	"install_no_docker" "No Docker Installation" \
	"help" "Help" \
    "exit" "Exit" \
	3>&1 1>&2 2>&3)

case $setup_menu in

    "install_simple")

    ;;
    "install_custom")

    ;;
    "install_no_docker")

    ;;
    "help")

    ;;
    "exit")

    ;;
    esac
    return 0
}