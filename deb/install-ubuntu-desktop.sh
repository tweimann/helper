#!/bin/bash

#check for root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

#install updates
sudo apt -y update
sudo apt -y upgrade

#install basic desktop
sudo apt install -y gdm3 ubuntu-desktop-minimal firefox gnome-tweaks snapd
sudo snap install onlyoffice-desktopeditors mailspring

#install remmina
sudo apt install remmina remmina-plugin-rdp remmina-plugin-spice remmina-plugin-vnc
