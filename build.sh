(cd ros && \
rosdep install -i --from-path src --rosdistro humble -y && \
colcon build --symlink-install)

source /app/ros/install/local_setup.bash