#!/bin/bash

set -e

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

# Define config directory
CONFIG_DIR="$HOME/.config/i3blocks"

mkdir -p $CONFIG_DIR

# Copy the config file
cp "$SCRIPT_DIR"/.config/i3blocks/i3blocks.conf $CONFIG_DIR

echo "Successfully configured i3blocks."
