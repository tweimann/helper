#!/bin/bash

#check for root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

sudo dpkg-reconfigure keyboard-configuration
sudo dpkg-reconfigure tzdata
