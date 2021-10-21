#!/usr/bin/env bash

WORKING_DIR=$(pwd)

# Install alacritty
sudo add-apt-repository ppa:mmstick76/alacritty
sudo apt update
sudo apt install alacritty -y

# Get config
mkdir -p ~/.config/alacritty/
cp "$WORKING_DIR"/.config/alacritty/alacritty.yml ~/.config/alacritty/

# Download theme
wget https://github.com/dracula/alacritty/archive/master.zip

unzip master.zip -d Dracula

cd Dracula
mv alacritty-master/* .
rm -rf alacritty-master

cd ..

rm master.zip

mkdir -p ~/.config/alacritty/themes/
mv Dracula ~/.config/alacritty/themes/

# Update default terminal
sudo update-alternatives --config x-terminal-emulator