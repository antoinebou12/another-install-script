#!/usr/bin/env bash
#
# @file qemu.sh
# @brief to use qemu with ansible and vagrant for testing installation
# https://www.unixmen.com/how-to-install-and-configure-qemu-in-ubuntu/

# @description install the quemu 
#
# @noargs
function install_qemu(){
    apt-get install qemu-kvm qemu virt-manager virt-viewer libvirt-bin
}

# @description qemu create a image for qemu
#
# @args $1 img of the os
# @args $2 the num of gb for img
function create_qemu_img(){
    qemu-img create -f qcow2 "$1" "$2"
}

# @description install the os on the image first time qemu
#
# @args $1 img of the os
# @args $2 the iso of the os
# @args $3 boot cd
# @args $4 mem for the os
function install_qemu_32vm(){
    qemu-system-xi386 -hda "$1" -boot d -cdrom "$2" "$3" -m "$4"
}

# @description run 32 bits vm with qemu
#
# @args $1 img of the os
# @args $1 img of the os
function run_qemu_32vm(){
    qemu -hda "$1" -m "$2"
}