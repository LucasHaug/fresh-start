#!/usr/bin/env bash

WORKING_DIR=$(pwd)

# Install alacritty
sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

git clone https://github.com/alacritty/alacritty.git

cd alacritty

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Build
cargo build --release

# Post install
## Terminfo
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info

## Desktop entry
sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

## Manual page
sudo apt install gzip

sudo mkdir -p /usr/local/share/man/man1
gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
gzip -c extra/alacritty-msg.man | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null

## Bash completion
mkdir -p ~/.bash_completion
cp extra/completions/alacritty.bash ~/.bash_completion/alacritty
echo "source ~/.bash_completion/alacritty" >> ~/.bashrc

## Fish completion
fish_complete_path=$(fish -c "echo \$fish_complete_path[1]")
mkdir -p $fish_complete_path
cp extra/completions/alacritty.fish $fish_complete_path/alacritty.fish

## End
cd ..
rm -rf alacritty

# Get config
mkdir -p ~/.config/alacritty/
cp "$WORKING_DIR"/.config/alacritty/alacritty.yml ~/.config/alacritty/

# Apply theme
mkdir -p ~/.config/alacritty/themes/
cp "$WORKING_DIR"/.config/alacritty/themes/dracula.yml ~/.config/alacritty/themes/

# Update default terminal
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $(which alacritty) 50

sudo update-alternatives --config x-terminal-emulator
