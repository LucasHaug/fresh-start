#!/usr/bin/env bash

WORKING_DIR=$(pwd)

# Install fonts
sudo apt install fonts-firacode -y
sudo apt install fonts-powerline -y

# Install tilda and config
sudo apt install tilda -y
cp "$WORKING_DIR"/.config/tilda/config_0 ~/.config/tilda/config_0
cp "$WORKING_DIR"/.config/autostart/tilda.desktop ~/.config/autostart/tilda.desktop

# Install tmux and config
sudo apt install tmux -y

cd
git clone https://github.com/gpakosz/.tmux.git

cp "$WORKING_DIR"/.config/tmux/.tmux.conf ~/.tmux/
cp "$WORKING_DIR"/.config/tmux/.tmux.conf.local ~/.tmux/

ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

tmux source-file ~/.tmux.conf

printf "if status is-interactive; and not set -q TMUX\r\n    exec tmux\r\nend\r\n\n" >> ~/.config/fish/config.fish


