#!/usr/bin/env bash

# Get Dracula
wget https://github.com/dracula/gtk/archive/master.zip

unzip master.zip -d Dracula

cd Dracula
mv gtk-master/* .
rm -rf gtk-master

cd ..

rm master.zip

mkdir -p ~/.themes
mv Dracula ~/.themes

gsettings set org.gnome.desktop.interface gtk-theme "Dracula"
gsettings set org.gnome.desktop.wm.preferences theme "Dracula"

# Get icons
sudo add-apt-repository ppa:numix/ppa
sudo apt update
sudo apt install numix-icon-theme-circle

gsettings set org.gnome.desktop.interface icon-theme 'Numix-Circle'

# Install tweaks
sudo apt install gnome-tweak

# @todo Do the following using the command line
echo "Install the Gnome Extension: User Themes and in 'Appearance' change the shell theme to Dracula"
