RUN apt-get update
RUN apt install firefox # for downloading Arduino IDE or other
RUN apt install wget -y
RUN apt install curl -y
# for ROS2
	# set locale
RUN sudo apt update && sudo apt install locales
RUN sudo locale-gen en_US en_US.UTF-8
RUN sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
RUN export LANG=en_US.UTF-8
RUN sudo apt install software-properties-common
RUN sudo add-apt-repository universe
RUN sudo apt update && sudo apt install curl gnupg lsb-release
RUN sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
RUN sudo apt update 
RUN sudo apt upgrade
RUN sudo apt install ros-humble-desktop
RUN source /opt/ros/humble/setup.bash
# for Gazebo, use one liner
RUN curl -sSL http://get.gazebosim.org | sh 
