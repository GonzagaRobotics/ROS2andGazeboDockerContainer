# ROS2andGazeboDockerContainer

Installation Instructions: 
- Download docker desktop: https://www.docker.com/products/docker-desktop

Windows 
- Maybe: Download and Install WSL 2 
- Download VcXsrv: https://sourceforge.net/projects/vcxsrv/  
- Launch VcXsrv after installing and on the extra settings page:
  - check the clipboard, primary selection, and disable access control options
  - uncheck the "Native opengl" option
  - Save these settings to a “config.xlaunch” file so you can tap this file and not have to go through these steps 
  - run "config.xlaunch" whenever you want to launch a GUI program with your docker container
- `git clone git@github.com:GonzagaRobotics/ROS2andGazeboDockerContainer.git`
- `cd ROS2andGazeboDockerContainer`
- `docker-compose up `
  - This will take a while to complete 
- `docker run -it -e DISPLAY=<your veth ip address>:0.0 -p 11345:11345 --name robotics ros2andgazebodockercontainer-robotics` 
  - Go to your command prompt and run ipconfig/all 
  - Then look for the IPv4 address under “Ethernet adapter vEthernet (WSL):” 
  - May have to keep updating your DISPLAY environment variable after closing and reopening your docker container 
- `ign gazebo` 
  - Type this command to make sure your container can display graphics 
- You can use this command to start up container after: `docker start -ai robotics` 

MAC (Test installation of this docker container on someone’s Mac): 
- Download XQuartz: https://www.xquartz.org/  
- Follow Running GUI’s with Docker on Mac OS X: https://cntnr.io/running-guis-with-docker-on-mac-os-x-a14df6a76efc  

Linux:  
- `git clone git@github.com:GonzagaRobotics/ROS2andGazeboDockerContainer.git` 
- `cd ROS2andGazeboDockerContainer` 
- `docker-compose up` 
- `sudo docker run -it --name robotics ros2andgazebodockercontainer-robotics` 
- `ign gazebo` 
 - Type this command to make sure your container works 
- You can use this command to start up container after: `docker start -ai robotics` 

Tutorials to go through:
- ROS2: https://docs.ros.org/en/humble/Tutorials.html
  - For opening multiple terminal windows for the Docker instance use tmux: https://www.ocf.berkeley.edu/~ckuehl/tmux/
  - For opening and writing to text files use Vim: https://www.openvim.com/
- Ignition Gazebo: https://gazebosim.org/docs
