# Install and configure Kismet with GPS
A Bash script for installing and configuring kismet.
You will be prompted for user input on the username you'd like to create a kismet log directory.

Upon installation, you will be able to collect on hci0, wlan0 (internal cards), and ttyUSB0.


Copy the script to your linux machine: 

```wget https://raw.githubusercontent.com/BwithE/kismet/main/kismet_install.sh```

Make the script executable: 

```sudo chmod +x kismet_install.sh```

Run the script:

```sudo ./kismet_install.sh``` 

OR

```sudo bash kismet_install.sh```

Documentation can be found at https://www.kismetwireless.net/
