#!/bin/bash

#check for root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

#get username
echo "Please Enter your username"
read USER

#install updates
sudo apt -y update
sudo apt -y upgrade

#install samba
sudo apt install -y samba samba-common 

#auto-add standard config
mkdir /home/$USER/sambashare
sudo echo "[sambashare]                        " >> /etc/samba/smb.conf
sudo echo "    comment = Samba on Ubuntu       " >> /etc/samba/smb.conf
sudo echo "    path = /home/$USER/sambashare   " >> /etc/samba/smb.conf
sudo echo "    read only = no                  " >> /etc/samba/smb.conf
sudo echo "    browsable = yes                 " >> /etc/samba/smb.conf

sudo service smbd restart
sudo ufw allow samba

#add a password
sudo smbpasswd -a $USER
sudo chown $USER /home/$USER/sambashare 

echo "connect to it via \\\\server-ip\\sambashare"
