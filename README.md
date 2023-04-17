# ROS2andGazeboDockerContainer

##Installation Instructions: 
- For all
  - Highly recommended that change your computer to become either a dual booted or purely Linux computer (as ROS and Gazebo with USB pass through work natively only on Linux machines)
  - Download docker desktop: https://www.docker.com/products/docker-desktop
  - Or for Linux download the `apt` version of Docker (here: https://docs.docker.com/engine/install/ubuntu/) not the `snap` version
  - clone repo with `git clone git@github.com:GonzagaRobotics/ROS2andGazeboDockerContainer.git`
  - run `cd ROS2andGazeboDockerContainer`
- Windows
  - Download and Install WSL 2: https://learn.microsoft.com/en-us/windows/wsl/install-manual
  - Download and install VcXsrv: https://sourceforge.net/projects/vcxsrv/
  - Run xlaunch.exe, which is in `C:\Program Files\VcXSrv\` after installing and on the extra settings page:
    - check the clipboard, primary selection, and disable access control options
    - uncheck the `Native opengl` option
    - Save these settings to a `config.xlaunch` file so you can tap this file and not have to go through these steps
    - run `config.xlaunch` whenever you want to launch a GUI program with your docker container
  - Using the `Command Prompt` in the `ROS2andGazeboDockerContainer` repo run `.\start_windows_docker.bat` to start and enter the container
  - Enter command `vim ~/.bashrc`
  - `Shift+G` to go to the bottom of the file
  - press `i` to enter insert mode (DO NOT USE YOUR MOUSE TO CLICK, use arrow keys to move around the cursor)
  - Type: `export DISPLAY=host.docker.internal:0.0`
  - Exit vim by pressing the escape key, `ESC`, then typing `:q` then enter.
  - back in the container command line, run `source ~/.bashrc`
- Linux
  - Run `./start_linux_docker.sh` to start and enter the container
- Mac
  - Download XQuartz: https://www.xquartz.org/
  - Follow Running GUI’s with Docker on Mac OS X: https://cntnr.io/running-guis-with-docker-on-mac-os-x-a14df6a76efc
  - Run `./start_mac_docker.sh` to start and enter the container
- On Jetson
  - Run `./start_jetson_docker.sh` to start and enter the container
- On All to make sure graphics are working
  - Test with `ign gazebo` in the container

Tutorials to go through:
- ROS2: https://docs.ros.org/en/humble/Tutorials.html
  - For opening multiple terminal windows for the Docker instance use tmux: https://www.ocf.berkeley.edu/~ckuehl/tmux/
  - For opening and writing to text files use Vim: https://www.openvim.com/
- Ignition Gazebo: https://gazebosim.org/docs

Info:
- Contains ROS2 Humble and Ignition Gazebo as well as ROS2 setup with commands from the tutorial
