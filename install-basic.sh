#!/bin/bash

#check for root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

#install updates
sudo apt -y update
sudo apt -y upgrade

#install languages
sudo apt install -y python3 nodejs java pip3

#install openssh
sudo apt install -y openssh-server openssh-client 

#install nettools
sudo apt install -y net-tools

#install build tools
sudo apt install -y build-essential

#install editors
sudo apt install -y nano vim

#install helpers
sudo apt install -y htop neofetch 
