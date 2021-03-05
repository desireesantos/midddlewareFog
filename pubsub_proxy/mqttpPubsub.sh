#!/bin/bash

GREEN='\033[0;32m'
WHITE='\033[1;37m'
echo ""

echo -e "${GREEN}Create folder host machine ...${WHITE}" 
cd 
mkdir mosquito_host_machine
cd mosquito_host_machine
mkdir config
mkdir data
mkdir log
echo -e "${GREEN}Done"
echo ""
echo -e -n "mosquito_host_machine folder path: ${WHITE}"
pwd
ls

copyMosquittoConfigFile() {
echo " "
echo -e "${GREEN}Clone eclipse mosquitto to copy config file ${WHITE}"
git clone https://github.com/eclipse/mosquitto.git eclipse-mosquitto
echo " "

cd eclipse-mosquitto
echo -e "${GREEN}Copy mosquitto.conf config file to mosquito_host_machine folder ${WHITE}"
mv mosquitto.conf ~/mosquito_host_machine/mosquitto/config/
cd ..
echo " "

echo -e "${GREEN}Delete eclipse Mosquitto repo ${WHITE}"
rm -rf eclipse-mosquitto
}

# Configure MQTT coping mosquitto config file
    if git --version &>/dev/null; then
        copyMosquittoConfigFile
    else
        brew install git
        copyMosquittoConfigFile
    fi
