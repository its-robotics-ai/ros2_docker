index
1. ros2_docker on Desktop
2. ros2_docker on Jetson

---


# ros2_docker on Desktop

* desktop PC
* ROS2 `Foxy`
* `osrf/ros:foxy-desktop`


|tested||
|:---:|:---:|
|Ubuntu18.04|OK|
|Windows|not yet|
|MAC|not yet|


```bash
docker run -it --rm --network host osrf/ros:foxy-desktop bash
```
>참고 runtime 및 display 설정은 아직 안했음



# ros2_docker on Jetson

* Jetson Board
* ROS2 `Foxy`
* L4T `L4T 32.6.1`
* `dustynv/ros:foxy-ros-base-l4t-r32.6.1`


|tested||
|:---:|:---:|
|Jetson Nano|OK|
|Jetson Xavier NX|OK|


## How We Start


### docker setting

먼저 도커를 설정합니다.

```bash
#docker setting
sudo gedit /etc/docker/daemon.json
```

`"default-runtime": "nvidia"` 을 추가해줍니다.

```
{
    "runtimes": {
        "nvidia": {
            "path": "nvidia-container-runtime",
            "runtimeArgs": []
        }
    },

    "default-runtime": "nvidia"
}
```

### repo setting

이제 레포를 다운 받습니다.

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

