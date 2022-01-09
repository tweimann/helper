#!/bin/bash

#check for root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

#install updates
sudo pacman -Syu

#install git
sudo pacman -S git --needed base-devel

# clone and enter the yay repo
git clone https://aur.archlinux.org/yay-git.git
cd yay-git/

# build timeshift
makepkg -si

# cleanup
cd .. && sudo rm -rf ./yay-git