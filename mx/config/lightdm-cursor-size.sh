#!/bin/bash

set -e

FILE="/etc/lightdm/lightdm-gtk-greeter.conf"

if ! grep -q "^cursor-theme-name" "$FILE"; then
    echo "cursor-theme-name = Adwaita" | sudo tee -a "$FILE"
    echo "Added cursor-theme-name = Adwaita."
fi

if ! grep -q "^cursor-theme-size" "$FILE"; then
    echo "cursor-theme-size = 24" | sudo tee -a "$FILE"
    echo "Added cursor-theme-size = 24."
fi

echo "Done."
