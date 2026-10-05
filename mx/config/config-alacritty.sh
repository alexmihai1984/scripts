#!/bin/bash

set -e

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

# Define config directory
CONFIG_DIR="$HOME/.config/alacritty"
THEMES_DIR="$CONFIG_DIR/themes"

rm -rf $THEMES_DIR
mkdir -p $THEMES_DIR
git clone https://github.com/alacritty/alacritty-theme $THEMES_DIR

# Create the directory if it doesn't exist
mkdir -p $THEMES_DIR

# Copy the alacritty.toml file
cp "$SCRIPT_DIR"/.config/alacritty/* $CONFIG_DIR

echo "Successfully configured alacritty."
