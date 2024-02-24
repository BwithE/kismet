#!/bin/bash


clear
# Checks to verify that the script is running as root
if [[ $EUID -ne 0 ]]; then
   echo "THIS SCRIPT NEEDS TO BE RUN AS ROOT."
   echo "EX: sudo bash kismet.sh"
   exit 1
fi

# Asking user input for name, to declare variable
clear
read -p "What is your username: " user

# Create kismet directory based off user input
echo "Creating kismet directory. "
mkdir /home/$user/kismet

clear
# Sets kismet_site.conf location
kismet_conf="/etc/kismet/kismet_site.conf"

# Install kismet
echo "Installing kismet. "
wget -O - https://www.kismetwireless.net/repos/kismet-release.gpg.key --quiet | gpg --dearmor | sudo tee /usr/share/keyrings/kismet-archive-keyring.gpg >/dev/null
echo 'deb [signed-by=/usr/share/keyrings/kismet-archive-keyring.gpg] https://www.kismetwireless.net/repos/apt/release/bullseye bullseye main' | sudo tee /etc/apt/sources.list.d/kismet.list >/dev/null
sudo apt update -y
sudo apt install kismet -y
clear

# Create the following config file for kismet
cat <<EOF > "$kismet_conf"
#!kistmet_site.conf
#bluetooth
source=hci0:type=linuxbluetooth
#wifi
source=wlan0:default_ht20=true:channel_hoprate=5/sec,type=linuxwifi
#source=wlan1:default_ht20=true:channel_hoprate=5/sec,type=linuxwifi
#gps
gps=gpsd:host=localhost,port=2947
#Update logging path
log_prefix=/home/$user/kismet
log_types=kismet,pcapng
EOF

clear

# Install GPS drivers
sudo apt install gpsd -y
clear

# Start gpsd to use the GPS puck
sudo gpsd /dev/ttyUSB0
clear

# List all previous device associations
#sudo dmesg

echo "Kismet installed."
echo "Kismet conf file located at /etc/kismet/kismet_site.conf"
echo "To see GPS device settings, run 'dmesg'"
