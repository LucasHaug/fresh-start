#!/usr/bin/env bash

# Make sure to download the following item and place it inside the folder called Downloads
# - J-Link: https://www.segger.com/downloads/jlink/

DOWNLOADS_DIR=$(pwd)/st/Downloads

# ===== Install J-Link =====

sudo dpkg -i $DOWNLOADS_DIR/JLink*.deb
