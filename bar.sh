#!/usr/bin/env bash

#####################################
## Configure the following variables
#####################################

USER_PROGRAMS_FOLDER="$HOME/room/UserPrograms"

#####################################
## Configuration end
#####################################

WORKING_DIR=$(pwd)

# Install polybar necessary dependencies
sudo apt install build-essential git cmake cmake-data pkg-config python3-sphinx python3-packaging libuv1-dev libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev

# Install theme dependencies
sudo apt install libxcb-cursor-dev libasound2-dev libnl-genl-3-dev rofi gnome-screensaver gnome-session

mkdir -p ~/.fonts/
cp -rf "$WORKING_DIR"/.fonts/* ~/.fonts/
fc-cache -f

# Install polybar
cd $USER_PROGRAMS_FOLDER

git clone --recursive https://github.com/polybar/polybar

cd polybar

mkdir build
cd build

cmake ..
make -j4

sudo make install

# Install theme
# Originally from https://github.com/adi1090x/polybar-themes/tree/master/simple/shades
cp -r "$WORKING_DIR"/.config/polybar/ ~/.config/

# Enable polybar on startup
mkdir -p ~/.config/autostart/
cat <<EOF > ~/.config/autostart/polybar.desktop
[Desktop Entry]
Type=Application
Exec=$HOME/.config/polybar/shapes/launch.sh
Hidden=false
X-MATE-Autostart-enabled=true
Name=Polybar
EOF