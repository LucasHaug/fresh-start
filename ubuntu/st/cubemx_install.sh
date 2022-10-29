#!/usr/bin/env bash

# Make sure to download the following item and place it inside the folder called Downloads
# - STM32CubeMX: https://www.st.com/en/development-tools/stm32cubemx.html

USER_PROGRAMS_FOLDER="/home/lhaug/room/UserPrograms"

ST_DIR=$(pwd)/st

DOWNLOADS_DIR=$ST_DIR/Downloads

# ===== Install CubeMX =====

unzip $DOWNLOADS_DIR/en.stm32cubemx* -d $DOWNLOADS_DIR/cubemx

cd $DOWNLOADS_DIR/cubemx

chmod +x SetupSTM32CubeMX*

# In the Installation Wizard, use the following installation path: $USER_PROGRAMS_FOLDER/STM32CubeMX
sudo ./SetupSTM32CubeMX*

printf "set -x CUBE_PATH \$USER_PROGRAMS_FOLDER/STM32CubeMX\r\n\n" >> ~/.config/fish/config.fish

printf "alias cube='$USER_PROGRAMS_FOLDER/STM32CubeMX/STM32CubeMX'\r\n\n" >> ~/.config/fish/config.fish

# Add Desktop Entry

cp $ST_DIR/icons/STM32CubeMX.png $USER_PROGRAMS_FOLDER/STM32CubeMX/help/

cat <<EOF > $HOME/.local/share/applications/stm32cubemx.desktop
[Desktop Entry]
Name=STM32CubeMX
GenericName=STM32CubeMX
Comment=Graphical tool for configuration of STM32 Microcontrollers
Exec=$USER_PROGRAMS_FOLDER/STM32CubeMX/STM32CubeMX
Icon=$USER_PROGRAMS_FOLDER/STM32CubeMX/help/STM32CubeMX.png
Terminal=false
X-MultipleArgs=false
Type=Application
StartupWMClass=STM32CubeMX
StartupNotify=true
Categories=Development;Electronics;
EOF
