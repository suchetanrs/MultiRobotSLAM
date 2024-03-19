FROM osrf/ros:humble-desktop-full-jammy

#setup
ENV DEBIAN_FRONTEND="noninteractive"

COPY ./root_dir/shell_scripts/basic_util.sh /root/
RUN cd /root/ && sudo chmod +x * && ./basic_util.sh && rm -rf basic_util.sh
COPY ./root_dir/shell_scripts/vscode_install.sh /root/
RUN cd /root/ && sudo chmod +x * && ./vscode_install.sh && rm -rf vscode_install.sh
COPY ./root_dir/shell_scripts/colcon.sh /root/
RUN cd /root/ && sudo chmod +x * && ./colcon.sh && rm -rf colcon.sh
COPY ./root_dir/shell_scripts/ros_package_install_essential.sh /root
RUN cd /root/ && sudo chmod +x * && ./ros_package_install_essential.sh && rm -rf ros_package_install_essential.sh
COPY ./root_dir/ros2_ws /root/ros2_ws
RUN cd /root/ros2_ws/ && rosdep update && apt-get update && apt-get update --fix-missing && apt-get upgrade -y
RUN cd /root/ros2_ws/ && source /opt/ros/humble/setup.bash && rosdep install --from-paths src --ignore-src -r -y
# COPY ./root_dir/shell_scripts/all-installed-packages.sh /root
# RUN cd /root/ && sudo chmod +x * && ./all-installed-packages.sh && rm -rf all-installed-packages.sh
# COPY ./root_dir/shell_scripts/new_apps.sh /root
# RUN cd /root/ && sudo chmod +x * && ./new_apps.sh && rm -rf new_apps.sh