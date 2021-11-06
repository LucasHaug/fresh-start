#!/usr/bin/env bash

# Make sure to download the following item and place it inside the folder called Downloads
# - STM32CubeMonitor: https://www.st.com/en/development-tools/stm32cubemonitor.html

USER_PROGRAMS_FOLDER="/home/lhaug/room/UserPrograms"

DOWNLOADS_DIR=$(pwd)/st/Downloads

# ===== Prepare =====

unzip $DOWNLOADS_DIR/en.STM32CubeMon* -d $DOWNLOADS_DIR/cubemonitor

cd $DOWNLOADS_DIR/cubemonitor

# ===== Install STM32CubeMonitor =====

sudo dpkg -i stm32cubemonitor*.deb

# ===== Install Drivers =====

sudo dpkg -i driver/st-stlink-udev-rules*.deb
