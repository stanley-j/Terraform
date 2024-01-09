#!/bin/bash


URL='https://www.tooplate.com/zip-templates/2131_wedding_lite.zip'
ART_NAME='2131_wedding_lite'
TEMPDIR="/tmp/webfiles"

# Set Variables for Ubuntu
PACKAGE="apache2 wget unzip"
SVC="apache2"

# Installing Dependencies
sudo apt update
sudo apt install $PACKAGE -y > /dev/null

# Start & Enable Service
sudo systemctl start $SVC
sudo systemctl enable $SVC

# Creating Temp Directory
mkdir -p $TEMPDIR
cd $TEMPDIR

wget $URL > /dev/null
unzip $ART_NAME.zip > /dev/null
sudo cp -r $ART_NAME/* /var/www/html/

# Bounce Service
systemctl restart $SVC

# Clean Up
rm -rf $TEMPDIR
echo "cleanup done"