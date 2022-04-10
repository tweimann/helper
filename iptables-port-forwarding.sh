#!/bin/bash

# ever wanted to forward a port from the outside to an internal ip address (e.g. 110.120.130.140)
# to an internal ip (e.g. 10.8.0.2 if you have a vpn configured)? then this script is made for you!

# check for root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# disclaimer
echo "Disclaimer: This script comes WITHOUT any warranty."
echo "You are responsible for your actions and I (@tweimann on github)"
echo "CAN NOT be held accountable for any damage this script may cause."
echo "---------------------------------------"

# welcome
echo "Welcome to the IPTables Port Forwarder!"
echo "---------------------------------------"

# required values explaination
echo "The required values are: "
echo "      i = the interface the packet will come from (e.g. eth0, aka source interface)"
echo "      s = the ip the packet should be sent back to (e.g. 10.8.0.1, aka source-ip)"
echo "      x = the Port you want to Access from the outside (e.g. 6969, aka prerouting dport)"
echo "      y = the IP the packet should be forwarded to (e.g. 10.8.0.2, aka dest-ip)"
echo "      z = the port the packet should be forwarded to (e.g. 80, aka postrouting dport)"
echo "---------------------------------------"

# read values
read -p "Please enter i: " i
read -p "Please enter s: " s
read -p "Please enter x: " x
read -p "Please enter y: " y
read -p "Please enter z: " z
echo "---------------------------------------"

# set the iptables rules
iptables -t nat -A PREROUTING -i $i -p tcp --dport $x -j DNAT --to-dest $y:$z # set the prerouting
iptables -t nat -A POSTROUTING -d $y -p tcp --dport $z -j SNAT --to-source $s # set the postrouting

# good job :)
echo "If you can see this it probably worked and you didn't fuck up the entire server (yet)."
echo "Good job :)"
echo "---------------------------------------"

# make values persistent?
read -p "Save the values and make it persistent? [y/n]: " save
if ($save = "y")
    iptables-save > /etc/iptables/rules.v4
    echo "Config saved successfully (probably, i didn't include any error handling lol)"
fi
echo "---------------------------------------"

echo "Exit."