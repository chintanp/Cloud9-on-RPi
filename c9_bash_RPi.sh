#!/bin/bash

clear

echo "The script to install Cloud9 on this system starts now"
echo "This will install node v0.10 and update and upgrade apt-get"
echo "This may break a few things"
echo "Here it goes."

cd ~

sudo apt-get update -y && sudo apt-get upgrade -y

echo "We will now get v0.10 of NodeJS"
wget http://nodejs.org/dist/v0.10.28/node-v0.10.28-linux-arm-pi.tar.gz

cd /usr/local

tar -xzf ~/node-v0.10.28-linux-arm-pi.tar.gz --strip=1

export NODE_PATH=”/usr/local/lib/node_modules”

echo "Now getting the latest Cloud9 SDK"

git clone git://github.com/c9/core.git c9sdk

cd c9sdk

scripts/install-sdk.sh

echo "And now the magic begins"
echo "------------------------"

./server.js -l 0.0.0.0 -a : -w ~
    
