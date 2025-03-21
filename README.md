# What is it?
This Script will automatically fullfill the Prerequisites to get Ubuntu managed with Intune. 
It will download the Intune Portal as well as MSEdge and automatically reboot the device if its finished. 

After running the script you just need to login in Intune Portal with your MS account.

The Script got created, because the original script from MS doesnt work as expected anymore. 

# Quickrun
sudo /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/sschmocker/Linux-Intune-Management/refs/heads/main/linux_intune_prepscript.sh)"
