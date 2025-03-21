#!/bin/bash

# Create function to pause the script if needed
function pause(){
  read -p "$*"
}

#Checking if script runs as root user, if not Exit
if [ "$EUID" -ne 0 ]
	then echo "Please run script as root"
	exit 1
fi

# Install pre-requisite Packages
sudo apt install -y wget apt-transport-https software-properties-common

# Download the Microsoft repository and GPG Keys
wget -q "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb"

# Register the Microsoft repository and GPG keys
dpkg -i packages-microsoft-prod.deb

# Update the list of packages after we have added packages.microsoft.com
sudo apt update

# Remove the repository & GPG key package (as we imported it above)
rm packages-microsoft-prod.deb

# Install the Intune portal
sudo apt install -y intune-portal

# Define Variables for Downloading Edge based on Latest version
version=$(curl -s https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-stable/ | tail -5 | head -1 | grep -oP '(?<=href=")[^"]*')
link='https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-stable/'
*
# Download latest Version of Edge
wget ${link}${version}

sudo dpkg -i ${version}

# Remove downloaded Package as we installed it above
rm ${version}

# Pause the script and inform the user about automated reboot
pause 'Your system needs to be rebooted, press any key to reboot'

# Reboot the Device in order to complete the pre-requirements steps
sudo reboot now
