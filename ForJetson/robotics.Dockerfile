FROM ubuntu:latest
RUN apt-get update
RUN apt install firefox -y # for downloading Arduino IDE or other
RUN apt install tmux -y
RUN apt install git -y
RUN apt install wget -y
RUN apt install curl -y
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
# if did not have the line below ros installation would ask for geo location
ENV DEBIAN_FRONTEND=noninteractive
RUN apt install ros-humble-ros-base -y 
RUN source /opt/ros/humble/setup.bash
