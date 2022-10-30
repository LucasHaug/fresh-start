#!/usr/bin/env bash

# Get Dracula for gtk4
wget https://github.com/odziom91/libadwaita-themes/archive/refs/heads/main.zip

unzip main.zip -d libadwaita-themes

cd libadwaita-themes/libadwaita-themes-main/dracula

unzip dracula-v42.zip -d dracula

mv dracula/gtk-4.0/* ~/.config/gtk-4.0

cd ../../..

rm -rf libadwaita-themes
rm main.zip

# Get Dracula for gtk3 and gtk2
wget https://github.com/dracula/gtk/archive/master.zip

unzip master.zip -d Dracula

cd Dracula/gtk-master

mv gtk-3.0/ ~/.config/gtk-3.0
mv gtk-2.0/ ~/.config/gtk-2.0

cd ../..

rm master.zip
rm -rf Dracula

# Get icons
sudo add-apt-repository ppa:papirus/papirus
sudo apt update
sudo apt install papirus-icon-theme

gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'

# Install tweaks
sudo apt install gnome-tweaks
