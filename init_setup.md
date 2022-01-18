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

---

한양대학교 Road Balance팀 강의 tutorial 도 설치해놨습니다.

[ROS 2 for G Camp](https://puzzling-cashew-c4c.notion.site/ROS-2-for-G-Camp-6f86b29e997e445badb69cc0af825a71)


```bash
git clone -b ros2 https://github.com/ros/xacro

colcon build --symlink-install --packages-select xacro
colcon build --symlink-install --packages-select gcamp_gazebo
```