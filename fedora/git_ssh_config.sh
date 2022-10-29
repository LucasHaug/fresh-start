#!/usr/bin/env bash

#####################################
## Configure the following variables
#####################################

GITHUB_EMAIL="email@email.com"

#####################################
## Configuration end
#####################################

# Generate new key
echo "[WARNING] Generate new key with name github"

ssh-keygen -t ed25519 -C "$GITHUB_EMAIL"

# Add key to ssh-agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/github

# Copy key
sudo dnf install xclip -y
xclip -selection clipboard < ~/.ssh/github.pub
