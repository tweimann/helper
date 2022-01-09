#!/bin/bash

#check for root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

function pause(){
 read -s -n 1 -p "Press any key to continue . . ."
 echo ""
}

sudo pacman -S cups
sudo pacman -S avahi nss-mdns

sudo systemctl enable cups
sudo systemctl start cups

echo "==================="
echo "please edit the \"hosts:\" line from /etc/nsswitch.conf to the following:"
echo "hosts: mymachines mdns_minimal [NOTFOUND=return] resolve [!UNAVAIL=return] files myhostname dns"
pause

sudo systemctl enable avahi-dnsconfd.service 
sudo systemctl start avahi-dnsconfd.service 

echo "==================="
echo "We will now show you the available IPP Printers on your Network"
ippfind
read IPPURI -p "Please enter the IPP Address of your Printer"
read PNAME -p "Please enter the Name of your Printer (customizable)"
lpadmin -p $PNAME -v $IPPURI -E -m everywhere