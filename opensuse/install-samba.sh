#!/bin/bash

#check for root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

#get the username
USER=$(whoami)

#install updates
sudo zypper up
sudo zypper dup

#install samba
sudo zypper install samba

#auto-add standard config
mkdir /home/$USER/sambashare
sudo echo "[sambashare]                        " >> /etc/samba/smb.conf
sudo echo "    comment = Samba on Ubuntu       " >> /etc/samba/smb.conf
sudo echo "    path = /home/$USER/sambashare   " >> /etc/samba/smb.conf
sudo echo "    read only = no                  " >> /etc/samba/smb.conf
sudo echo "    browsable = yes                 " >> /etc/samba/smb.conf

#start the samba service and allow it in the firewall (firewalld)
sudo systemctl enable smb nmb
sudo systemctl start smb nmb
sudo firewall-cmd --add-service=samba --permanent
sudo firewall-cmd --reload

#add a password
sudo smbpasswd -a $USER
sudo chown $USER /home/$USER/sambashare 

echo "connect to it via smb://[server-ip]/sambashare"
