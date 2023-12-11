#!/usr/bin/env bash

WORKING_DIR=$(pwd)

# Install alacritty
snap install alacritty --classic

# Get config
mkdir -p ~/.config/alacritty/
cp "$WORKING_DIR"/.config/alacritty/alacritty.yml ~/.config/alacritty/

# Apply theme
mkdir -p ~/.config/alacritty/themes/
cp "$WORKING_DIR"/.config/alacritty/themes/dracula.yml ~/.config/alacritty/themes/

# Update default terminal
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $(which alacritty) 50

sudo update-alternatives --config x-terminal-emulator
