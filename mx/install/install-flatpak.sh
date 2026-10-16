#!/bin/bash

sudo apt install flatpak -y

echo 'export XDG_DATA_DIRS="$HOME/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share"' >> ~/.profile
