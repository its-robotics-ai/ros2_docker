#!/bin/bash

#echo "[hls_lfcd_lds_driver]"
#cd ~/dev_ws/src
#git clone -b foxy-devel https://github.com/ROBOTIS-GIT/hls_lfcd_lds_driver
#cd ~/dev_ws 
#cbp hls_lfcd_lds_driver

echo "[turtlebot3_msgs]"
cd ~/dev_ws/src
git clone -b foxy-devel https://github.com/ROBOTIS-GIT/turtlebot3_msgs
cd ~/dev_ws 
cbp turtlebot3_msgs

echo "[DynamixelSDK]"
cd ~/dev_ws/src
git clone -b foxy-devel https://github.com/ROBOTIS-GIT/DynamixelSDK
cd ~/dev_ws 
cbp DynamixelSDK

echo "[turtlebot3_ws]"
mkdir -p ~/turtlebot3_ws/src && cd ~/turtlebot3_ws/src

git clone -b foxy-devel https://github.com/ROBOTIS-GIT/turtlebot3.git
cd ~/turtlebot3_ws/src/turtlebot3
rm -r turtlebot3_cartographer turtlebot3_navigation2
cd ~/turtlebot3_ws/
#echo 'source /opt/ros/foxy/setup.bash' >> ~/.bashrc
source ~/.bashrc
colcon build --symlink-install --parallel-workers 1
echo 'source ~/turtlebot3_ws/install/setup.bash' >> ~/.bashrc
source ~/.bashrc




