#!/usr/bin/env bash

WORKING_DIR=$(pwd)

# Install alacritty
sudo add-apt-repository ppa:mmstick76/alacritty
sudo apt update
sudo apt install alacritty -y

# Get config
mkdir -p ~/.config/alacritty/
cp "$WORKING_DIR"/.config/alacritty/alacritty.yml ~/.config/alacritty/

# Apply theme
mkdir -p ~/.config/alacritty/themes/
cp "$WORKING_DIR"/.config/alacritty/themes/dracula.yml ~/.config/alacritty/themes/

# Update default terminal
sudo update-alternatives --config x-terminal-emulator