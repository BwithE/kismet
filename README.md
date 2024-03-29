# Install and configure Kismet with GPS
This script is designed to automate the setup process for installing and configuring Kismet, a wireless network detector, sniffer, and intrusion detection system. Below is an overview of the script's usage, process, and key steps:

# Usage:
Copy the script: 

```wget https://raw.githubusercontent.com/BwithE/kismet/main/kismet_install.sh```

Then run the script:

```bash kismet_install.sh```


# Process Overview:
**User Input:** The script prompts the user to input their username, which is stored in a variable for later use.

**Creating Directory:** A directory named "kismet" is created under the user's home directory.

**Setting Configuration:** The script sets the location of the Kismet configuration file.

**Installing Kismet:** It installs Kismet by adding the necessary repository, updating the package list, and installing Kismet.

**Creating Kismet Configuration:** The script generates a configuration file for Kismet (kismet_site.conf) with specific settings for Bluetooth, Wi-Fi, and GPS sources.

**Installing GPS Drivers:** Installs GPSD, a service daemon that monitors one or more GPS devices attached to a host computer.

**Starting GPSD:** Initiates GPSD to utilize the GPS puck (GPS receiver).

**Displaying Device Associations:** Displays previous device associations using dmesg.

**Completion Message:** Notifies the user about the successful installation of Kismet, the location of the configuration file, and how to view GPS device settings.
