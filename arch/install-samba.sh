#!/bin/bash

#check for root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

#get the username
USER=$(whoami)

#install updates
sudo pacman -Syu

#install samba
sudo pacman -S samba

#auto-add standard config
mkdir /home/$USER/sambashare
sudo echo "[sambashare]                        " >> /etc/samba/smb.conf
sudo echo "    comment = Samba on Ubuntu       " >> /etc/samba/smb.conf
sudo echo "    path = /home/$USER/sambashare   " >> /etc/samba/smb.conf
sudo echo "    read only = no                  " >> /etc/samba/smb.conf
sudo echo "    browsable = yes                 " >> /etc/samba/smb.conf

#start the samba service
sudo systemctl enable smb
sudo systemctl restart smb
sudo systemctl enable nmb
sudo systemctl restart nmb

#add a password
sudo smbpasswd -a $USER
sudo chown $USER /home/$USER/sambashare 

echo "connect to it via \\\\server-ip\\sambashare"
echo "if you use a software firewall, you will have to allow samba"
echo "ufw       --> sudo ufw allow samba"
echo "firewalld --> firewall-cmd --permanent --add-service=samba"
echo "              firewall-cmd --reload"
