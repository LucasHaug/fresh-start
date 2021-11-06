#!/usr/bin/env bash

# Make sure to download the following item and place it inside the folder called Downloads
# - STM32CubeProg: https://www.st.com/en/development-tools/stm32cubeprog.html

USER_PROGRAMS_FOLDER="/home/lhaug/room/UserPrograms"

DOWNLOADS_DIR=$(pwd)/st/Downloads

# ===== Install CubeProg =====

unzip $DOWNLOADS_DIR/en.stm32cubeprg* -d $DOWNLOADS_DIR/cubeprog

cd $DOWNLOADS_DIR/cubeprog

chmod +x SetupSTM32CubeProgrammer*.linux

# In the Installation Wizard, use the following installation path: $USER_PROGRAMS_FOLDER/STM32CubeProgrammer
sudo ./SetupSTM32CubeProgrammer*.linux

# Needed when using the CubeProgrammer
sudo apt install libusb-1.0-0-dev

# Copy udev rules
cd $USER_PROGRAMS_FOLDER/STM32CubeProgrammer/Drivers/rules

sudo cp *.rules /etc/udev/rules.d

sudo udevadm trigger

# Set enviroment varibles
printf "set -x STM32_CUBE_PROGRAMMER \$USER_PROGRAMS_FOLDER/STM32CubeProgrammer/bin\r\n\n" >> ~/.config/fish/config.fish
printf "set -x  PATH \$PATH \$STM32_CUBE_PROGRAMMER\r\n\n" >> ~/.config/fish/config.fish

