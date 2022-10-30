#!/usr/bin/env bash

#####################################
## Configure the following variables
#####################################

GITHUB_USER="user"
GITHUB_EMAIL="email@email.com"
USER_PROGRAMS_FOLDER="$HOME/room/UserPrograms"

#####################################
## Configuration end
#####################################

WORKING_DIR=$(pwd)

# Update amd upgrade before starting
sudo apt update
sudo apt upgrade -y

# Install basic tools
sudo apt install build-essential git python3 python3-pip -y

# Config git
git config --global init.defaultBranch main
git config --global core.autocrlf input
git config --global user.name "$GITHUB_USER"
git config --global user.email "$GITHUB_EMAIL"

# install fonts
sudo apt install fonts-firacode fonts-powerline -y

# Config file explorer
cp "$WORKING_DIR"/.config/user-dirs.dirs ~/.config/user-dirs.dirs

# Install fish and related
sudo apt install fish -y

chsh -s $(which fish)

# Set initial config
touch ~/.config/fish/config.fish
printf "set -l USER_PROGRAMS_FOLDER $USER_PROGRAMS_FOLDER\r\n\n" >> ~/.config/fish/config.fish

# Install theme
sudo apt install curl

sudo sh -c "$(curl -fsSL https://starship.rs/install.sh)"

cp "$WORKING_DIR"/.config/starship.toml ~/.config/

printf "starship init fish | source\r\n\n" >> ~/.config/fish/config.fish

cp "$WORKING_DIR"/.config/fish/theme.fish ~/.config/fish/
printf "source ~/.config/fish/theme.fish\r\n\n" >> ~/.config/fish/config.fish

# Install bass and omf
yes | curl -L https://get.oh-my.fish | fish

fish -c 'omf install bass -y'

# Config local time
timedatectl set-local-rtc 1 --adjust-system-clock
