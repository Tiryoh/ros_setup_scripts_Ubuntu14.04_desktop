#!/bin/bash -exv

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list'

curl -k https://raw.githubusercontent.com/ros/rosdistro/master/ros.key | sudo apt-key add -

sudo apt-get update

sudo apt-get install -y ros-indigo-desktop-full
sudo apt-get install -y python-rosinstall
#sudo apt-get install -y python-catkin-pkg python-rosdep python-wstool ros-indigo-catkin
sudo apt-get install -y build-essential
sudo apt-get install -y linux-headers-$(uname -r)

sudo rosdep init
rosdep update

grep -F 'source /opt/ros/indigo/setup.bash' ~/.bashrc ||
echo 'source /opt/ros/indigo/setup.bash' >> ~/.bashrc

source /opt/ros/indigo/setup.bash

### instruction for user ###
set -xv

echo '***INSTRUCTION*****************'
echo '* do the following command    *'
echo '* $ source ~/.bashrc          *'
echo '* after that, try             *'
echo '* $ LANG=C roscore            *'
echo '*******************************'
