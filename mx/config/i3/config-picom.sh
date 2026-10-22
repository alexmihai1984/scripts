#!/bin/bash

set -e

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

# Define config directory
CONFIG_DIR="$HOME/.config/"

# Copy the config file
cp "$SCRIPT_DIR"/.config/picom.conf $CONFIG_DIR

echo "Successfully configured picom."
