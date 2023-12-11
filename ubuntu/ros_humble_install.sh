#!/usr/bin/env bash

WORKING_DIR=$(pwd)
ROS_DISTRO=humble

# Set locale
locale  # check for UTF-8

sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

locale  # verify settings

# Setup sources
sudo apt install software-properties-common
sudo add-apt-repository universe

sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

# Install ROS 2 packages
sudo apt update
sudo apt upgrade

sudo apt install ros-${ROS_DISTRO}-desktop-full -y

# Setup
printf "bass source /opt/ros/${ROS_DISTRO}/setup.bash\n\n" >> ~/.config/fish/config.fish

cp "$WORKING_DIR"/.config/fish/conf.d/ros2.autosource.fish ~/.config/fish/conf.d/

# RViz2 and RQt desktop entries
cat <<EOF > $HOME/.local/share/applications/rviz2.desktop
[Desktop Entry]
Name=RViz2
GenericName=RViz2
Comment=3D visualization tool for ROS 2
Exec=rviz2
Icon=/opt/ros/${ROS_DISTRO}/share/rviz_common/icons/package.png
Terminal=false
X-MultipleArgs=false
Type=Application
StartupNotify=true
Categories=Development;Robotics;
EOF

cat <<EOF > $HOME/.local/share/applications/rqt.desktop
[Desktop Entry]
Name=RQt
GenericName=RQt
Comment=Graphical tool for ROS 2
Exec=rqt
Icon=/opt/ros/${ROS_DISTRO}/share/rqt_gui/resource/rqt.svg
Terminal=false
X-MultipleArgs=false
Type=Application
StartupNotify=true
Categories=Development;Robotics;
EOF
