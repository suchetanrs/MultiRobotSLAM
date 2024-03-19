# MultiRobotSLAM ROS2 Wrapper Docker

This repository contains a humble with turtlebot3 and Gazebo.

# Steps to use this wrapper

## 1. Clone this repository

1. ```git clone https://github.com/suchetanrs/MultiRobotSLAM```
2. ```cd MultiRobotSLAM```

## 2. Install Docker on your system

```bash
cd MultiRobotSLAM
sudo chmod +x docker_install.sh
./docker_install.sh
```

## 3. Build the image

1. Build the image: ```sudo docker build -t ros2-base:22.04 .```
2. Add ```xhost +``` to your ```.bashrc``` to support correct x11-forwarding using ```echo "xhost +" >> ~/.bashrc```
3. ```source ~/.bashrc```
4. You can see the built images on your machine by running ```sudo docker images```.

## 4. Running the container

1. ```cd MultiRobotSLAM``` (ignore if you are already in the folder)
2. ```sudo docker compose run ros2-base```
3. This should take you inside the container. Once you are inside, run the command ```xeyes``` and a pair of eyes should pop-up. If they do, x11 forwarding has correctly been setup on your computer.

## 5. Building the packages

Launch the container using steps in (4).
```bash
source /opt/ros/humble/setup.bash
cd /root/ros2_ws/
colcon build --symlink-install
source install/setup.bash
```

## Launching Gazebo FIRST TIME

Launch the container using steps in (4).
If you are inside the container, run the following:

1. ```ros2 launch gazebo_ros gazebo.launch.py```
Since this is the first time, it will take a while to load gazebo. Please be patient. It will load well from the second time.

## Launching Turtlebot3

Remember to source /opt/ros/humble/setup.bash as well as ros2_ws/install/setup.bash

