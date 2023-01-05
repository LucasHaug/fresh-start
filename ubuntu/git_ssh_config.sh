#!/usr/bin/env bash

#####################################
## Configure the following variables
#####################################

GIT_EMAIL="email@email.com"
GIT_KEY_PATH="$HOME/.ssh/github"

#####################################
## Configuration end
#####################################

# Generate new key
ssh-keygen -t ed25519 -C "$GIT_EMAIL" -f "$GIT_KEY_PATH" -N ""

# Add key to ssh-agent
eval "$(ssh-agent -s)"
ssh-add $GIT_KEY_PATH

# Copy key
sudo apt install xclip -y
xclip -selection clipboard < $GIT_KEY_PATH.pub
