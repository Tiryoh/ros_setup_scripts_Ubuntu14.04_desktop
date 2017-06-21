#!/bin/bash -xve

# This script is required only when you did not get this script via Git.

### setup curl,git and openssh ###

sudo apt-get update
sudo apt-get install -y curl
sudo apt-get install -y git
sudo apt-get install -y openssh-server

### setup date

sudo date -s "$(curl -s --head http://www.google.co.jp | grep '^Date' | cut -b 7-)"

### cloning this repository ###

git clone https://github.com/Tiryoh/ros_setup_scripts_Ubuntu14.04_desktop.git

# If your git gives a SSL error, please try this.  ###
#GIT_SSL_NO_VERIFY=1 git clone https://github.com/Tiryoh/ros_setup_scripts_Ubuntu14.04_desktop.git

