#!/usr/bin/env bash

# Make sure to download the following item and place it inside the folder called Downloads
# - STM32CubeMX: https://www.st.com/en/development-tools/stm32cubemx.html

USER_PROGRAMS_FOLDER="/home/lhaug/room/UserPrograms"

DOWNLOADS_DIR=$(pwd)/st/Downloads

# ===== Install CubeMX =====

unzip $DOWNLOADS_DIR/en.stm32cubemx* -d $DOWNLOADS_DIR/cubemx

cd $DOWNLOADS_DIR/cubemx

chmod +x SetupSTM32CubeMX*

# In the Installation Wizard, use the following installation path: /home/lhaug/room/UserPrograms/STM32CubeMX
sudo ./SetupSTM32CubeMX*

printf "set -x CUBE_PATH \$USER_PROGRAMS_FOLDER/STM32CubeMX\r\n\n" >> ~/.config/fish/config.fish

printf "alias cube='$USER_PROGRAMS_FOLDER/STM32CubeMX/STM32CubeMX'\r\n\n" >> ~/.config/fish/config.fish
