#!/usr/bin/env bash

WORKING_DIR=$(pwd)

# Installation
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

sudo apt update

sudo apt install ros-noetic-desktop-full -y

# Setup
printf "bass source /opt/ros/noetic/setup.bash\n\n" >> ~/.config/fish/config.fish

mkdir -p ~/.config/fish/conf.d

cp "$WORKING_DIR"/.config/fish/conf.d/catkin.autosource.fish ~/.config/fish/conf.d/
cp "$WORKING_DIR"/.config/fish/conf.d/rosfish.fish ~/.config/fish/conf.d/