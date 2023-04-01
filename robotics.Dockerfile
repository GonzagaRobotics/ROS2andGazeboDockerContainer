FROM ubuntu:latest
RUN apt-get update
RUN apt install tmux git wget curl vim -y
# for ROS2
RUN apt update && apt install locales -y
RUN locale-gen en_US en_US.UTF-8
RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
RUN export LANG=en_US.UTF-8
RUN apt install software-properties-common -y
RUN add-apt-repository universe
RUN apt update && apt install curl gnupg lsb-release -y
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
# use bash instead of sh start
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Create a .profile
RUN echo 'PATH=$PATH:/foo/bar' > ~/.profile

# Create a .bash_profile
RUN echo 'PATH=$PATH:/hello-world' > ~/.bash_profile

RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null
RUN apt update 
RUN apt upgrade -y
ENV DEBIAN_FRONTEND=noninteractive
RUN apt install ros-humble-desktop -y # takes a while to download
RUN apt install ros-humble-turtlesim -y
RUN source /opt/ros/humble/setup.bash
# for Ignition Gazebo
RUN apt-get update
RUN apt-get install lsb-release wget gnupg -y # these are probably installed already
RUN wget https://packages.osrfoundation.org/gazebo.gpg -O /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null
RUN apt-get update
RUN apt-get install ignition-fortress -y
# Setting up more ROS things from the tutorial
RUN source /opt/ros/humble/setup.bash
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
RUN export ROS_DOMAIN_ID=1
RUN echo "export ROS_DOMAIN_ID=1" >> ~/.bashrc
 # not going to restrict to local host only
RUN apt install ~nros-humble-rqt* -y
RUN apt install python3-colcon-common-extensions -y
RUN apt install python3-rosdep -y --fix-missing
RUN apt install python3-pip

