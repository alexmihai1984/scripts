#!/bin/bash

set -e

git clone https://github.com/lr-tech/rofi-themes-collection.git ~/rofi-themes

mkdir -p ~/.local/share/rofi/themes/

cp ~/rofi-themes/themes/*.rasi ~/.local/share/rofi/themes/

rm -rf ~/rofi-themes
