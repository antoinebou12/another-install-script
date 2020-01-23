#!/bin/bash
#
# @file setup.sh
# @brief setup project

# import
source src/utils.sh
source src/install.sh
source src/containers.sh
source src/docker.sh

# @description create setup menu
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
function create_setup_menu(){
    
    WHIPTAIL_TEXT=$(( $(tput lines) - 4 ))
    WHIPTAIL_HEIGHT=$(($(tput cols) - 24))
    WHIPTAIL_WIDTH=$(($(tput lines) - 12))


    SETUP_MENU=$(whiptail --title "Main Menu" --menu --notags "" 20 78 12 -- \
	"install_simple" "Simple Installation" \
	"install_custom" "Custom Installation" \
	"install_no_docker" "No Docker Installation" \
	"help" "Help" \
    "exit" "Exit" \
	3>&1 1>&2 2>&3)

case SETUP_MENU in

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