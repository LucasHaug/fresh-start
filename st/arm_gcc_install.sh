#!/usr/bin/env bash

# Make sure to download the following item and place it inside the folder called Downloads
# - GNU Arm Embedded Toolchain: https://developer.arm.com/open-source/gnu-toolchain/gnu-rm/downloads

USER_PROGRAMS_FOLDER="/home/lhaug/room/UserPrograms"

DOWNLOADS_DIR=$(pwd)/st/Downloads

# ===== Install gcc-arm-none-eabi =====

mkdir -p $DOWNLOADS_DIR/arm_gcc

for file in $DOWNLOADS_DIR/gcc-arm-none-eabi*.tar.bz2; do tar -xvjf "$file" -C $DOWNLOADS_DIR/arm_gcc/; done

cd $DOWNLOADS_DIR/arm_gcc

ARM_DIR_NAME=(*)

cp -r $ARM_DIR_NAME $USER_PROGRAMS_FOLDER/

printf "set -x ARM_GCC_PATH \$USER_PROGRAMS_FOLDER/$ARM_DIR_NAME/bin\r\n\n" >> ~/.config/fish/config.fish
printf "set -x  PATH \$PATH \$ARM_GCC_PATH\r\n\n" >> ~/.config/fish/config.fish
