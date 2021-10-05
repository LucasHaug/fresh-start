#!/usr/bin/env bash

GITHUB_USER="user"
GITHUB_EMAIL="email@email.com"
USER_PROGRAMS_FOLDER="$HOME/room/UserPrograms"

# Update amd upgrade before starting
sudo apt update
sudo apt upgrade -y

# Install basic tools
sudo apt install gcc build-essential make git python3 python3-pip -y

# Config git
git config --global init.defaultBranch main
git config --global core.autocrlf input
git config --global user.name "$GITHUB_USER"
git config --global user.email "$GITHUB_EMAIL"

# Install fish and related
sudo apt install fish -y

chsh -s $(which fish)

sudo sh -c "$(curl -fsSL https://starship.rs/install.sh)"

printf "starship init fish | source\r\n\n" >> ~/.config/fish/config.fish

yes | curl -L https://get.oh-my.fish | fish

fish -c 'omf install bass -y'

printf "set -x LS_COLORS $LS_COLORS ':ow=01;35'\r\n\n" >> ~/.config/fish/config.fish
printf "set -l USER_PROGRAMS_FOLDER $USER_PROGRAMS_FOLDER\r\n\n" >> ~/.config/fish/config.fish

# Config local time
timedatectl set-local-rtc 1 --adjust-system-clock