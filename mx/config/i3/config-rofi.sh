#!/bin/bash

set -e

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

# Define config directory
CONFIG_DIR="$HOME/.config/rofi"

mkdir -p $CONFIG_DIR

# Copy the config file
cp "$SCRIPT_DIR"/.config/rofi/* $CONFIG_DIR

echo "Successfully configured rofi."
