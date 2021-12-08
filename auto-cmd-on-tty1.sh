#!/bin/bash

#check for root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

#create getty override folder
sudo mkdir /etc/systemd/system/getty@tty1.service.d/

#ask for the bin that should be executed
echo "Please enter the full Path for your command"
echo "Example:"
echo "/usr/bin/htop (for htop)"
read CMD

#echo some data to a new file
PATH = /etc/systemd/system/getty@tty1.service.d/override.conf
sudo echo "[Service]" >> $PATH
sudo echo "ExecStart=" >> $PATH
sudo echo "ExecStart=-$CMD" >> $PATH
sudo echo "StandardInput=tty" >> $PATH
sudo echo "StandardOutput=tty" >> $PATH

echo
echo "The script will now reload the getty service"
sudo systemctl daemon-reload; systemctl restart getty@tty1.service
