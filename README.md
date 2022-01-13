# ros2_docker

* Jetson
* ROS2 Foxy
* R32.6.1
* `dustynv/ros:foxy-ros-base-l4t-r32.6.1`

기본적으로 `root` 에서

```bash
mkdir -p ~/dev_ws/src
cd ~/dev_ws/src/
git clone -b foxy-devel https://github.com/ros/ros_tutorials.git
cd ..
rosdep install -i --from-path src --rosdistro foxy -y
colcon build
```
까지 진행해 놓은 상태이며 도커 실행 하면 기본으로 `source /opt/ros/foxy/install/setup.bash` 셋팅 되어 있습니다.

## How We Start

```
git clone https://github.com/its-robotics-ai/ros2_docker
cd ./ros2_docker
chmod +x ./start.sh
sudo sh ./start.sh
```
>여기까지 하면 docker pull 된 후 run !

```bash
# in docker
root@
```

이제 `dev_ws` 에서 `source` 설정 후에야 미리 설치한 `ros_tutorials` 이 활용가능합니다.


## tutorial

먼저 sourcing 
```bash
cd ~/dev_ws
source ./install/local_setup.bash
```
그 다음 터미널 창에서 `ros2 run t`까지 쳐놓고 `tab` 키 두 번 눌러서 `turtlesim` 이 나오지 않으면 build가 제대로 되지 않은 상태입니다. 아니 뭔가 이상한겁니다..;;


* docker terminal 1
```bash
ros2 run turtlesim turtlesim_node
```
거북이 잘 나오는거 확인 되었다면 

1. 다시 터미널을 jetson에서 열어서 (기존 도커가 jetson 새 창) 
2. 아까 실행했던 `start.sh`을 다시 실행 후 뜨는 도커 터미널에서
3. sourcing `cd ~/dev_ws && source ./install/local_setup.bash`

이어서 teleop 실행

* docker terminal 2
```bash
ros2 run turtlesim turtle_teleop_key
```

