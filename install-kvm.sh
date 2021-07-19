#!/bin/bash

#check for root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

#install updates
sudo apt -y update
sudo apt -y upgrade

sudo apt install -y qemu-kvm libvirt libvirt-client virt-install kvmtools

#for gui install:
#sudo apt install -y virt-manager virt-viewer

echo CHECK KVM AVAILABILITY...
kvm-ok
