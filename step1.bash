#!/bin/bash -exv

echo 'deb http://packages.ros.org/ros/ubuntu trusty main' > /tmp/$$-deb
sudo mv /tmp/$$-deb /etc/apt/sources.list.d/ros-latest.list

sudo apt-get install -y curl
curl -k https://raw.githubusercontent.com/ros/rosdistro/master/ros.key | sudo apt-key add -
sudo apt-get update

sudo apt-get install -y ros-indigo-ros-base

sudo rosdep init
sudo rosdep update

sudo apt-get install -y python-rosinstall
sudo apt-get install -y make
sudo apt-get install -y linux-headers-$(uname -r)

sudo rosdep fix-permissions
rosdep update

grep -F 'source /opt/ros/indigo/setup.bash' ~/.bashrc ||
echo 'source /opt/ros/indigo/setup.bash' >> ~/.bashrc

mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src
catkin_init_workspace
cd ~/catkin_ws
catkin_make
grep -F 'source ~/catkin_ws/devel/setup.bash' ~/.bashrc ||
echo 'source ~/catkin_ws/devel/setup.bash' >> ~/.bashrc

### instruction for user ###
set -xv

echo '***INSTRUCTION*****************'
echo '* do the following command    *'
echo '* $ source ~/.bashrc          *'
echo '* after that, try             *'
echo '* $ LANG=C roscore            *'
echo '*******************************'
