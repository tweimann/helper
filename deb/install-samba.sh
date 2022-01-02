#!/bin/bash

#check for root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

#get the username
USER=$(whoami)

#install updates
sudo apt -y update
sudo apt -y upgrade

#install samba
sudo apt install -y samba samba-common 

#auto-add default config
mkdir /home/$USER/sambashare
sudo chown $USER /home/$USER/sambashare 
sudo echo "[sambashare]                        " >> /etc/samba/smb.conf
sudo echo "    comment = Samba on Ubuntu       " >> /etc/samba/smb.conf
sudo echo "    path = /home/$USER/sambashare   " >> /etc/samba/smb.conf
sudo echo "    read only = no                  " >> /etc/samba/smb.conf
sudo echo "    browsable = yes                 " >> /etc/samba/smb.conf

#start the samba service and allow it in the firewall (ufw)
sudo service smbd restart
sudo ufw allow samba

#add a password
sudo smbpasswd -a $USER

echo "connect to it via smb://[server-ip]/sambashare"
