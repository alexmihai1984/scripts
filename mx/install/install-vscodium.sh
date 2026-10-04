#!/bin/bash
sudo apt install wget gpg

wget -qO- https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
  | sudo gpg --dearmor -o /usr/share/keyrings/vscodium-archive-keyring.gpg

echo 'deb [arch=amd64,arm64 signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg] https://download.vscodium.com/debs vscodium main' \
  | sudo tee /etc/apt/sources.list.d/vscodium.list

sudo apt update
sudo apt install codium
