#!/usr/bin/env bash

# Install gnome extensions
sudo apt install gnome-shell-extensions chrome-gnome-shell

# For Vitals
sudo apt install gir1.2-gtop-2.0 lm-sensors

# Install pop-shell
sudo apt install git node-typescript make

git clone https://github.com/pop-os/shell.git

cd shell
make depcheck
make compile
make install
make configure

printf "\n\n\n[WARNING] Restart your computer or log out to finish to install pop shell, run 'make enable' and erase shell folder\n\n"

# Install the remaining extensions
EXTENSIONS=(
  "Blur my Shell","https://extensions.gnome.org/extension/3193/blur-my-shell/"
  "Clipboard History","https://extensions.gnome.org/extension/4839/clipboard-history/"
  "Vitals","https://extensions.gnome.org/extension/1460/vitals/"
  "Aylur's Widgets", "https://extensions.gnome.org/extension/5338/aylurs-widgets/"
)

echo "Install the remaing extensions from https://extensions.gnome.org/:"

for i in "${EXTENSIONS[@]}"; do
    IFS=, read name url <<< "$i"
  echo "  - $name: $url"
done
