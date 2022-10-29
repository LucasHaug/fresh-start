#!/usr/bin/env bash

# Docker installation
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo

sudo dnf install docker-ce docker-ce-cli containerd.io docker-compose-plugin

sudo systemctl start docker

# Docker post-installation
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
