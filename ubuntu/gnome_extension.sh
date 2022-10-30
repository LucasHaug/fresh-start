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
make enable

cd ..
rm -rf shell

# Install the remaining extensions
EXTENSIONS=(
  "Pop Shell","https://github.com/pop-os/shell"
  "Blur my Shell","https://extensions.gnome.org/extension/3193/blur-my-shell/"
  "Clipboard History","https://extensions.gnome.org/extension/4839/clipboard-history/"
  "Freon","https://extensions.gnome.org/extension/841/freon/"
  "Vitals","https://extensions.gnome.org/extension/1460/vitals/"
)

echo "Install the remaing extensions from https://extensions.gnome.org/:"

for i in "${EXTENSIONS[@]}"; do
    IFS=, read name url <<< "$i"
  echo "  - $name: $url"
done
