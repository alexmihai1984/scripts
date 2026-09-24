#!/bin/bash

set -e

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

# Define config directory and file path
CONFIG_DIR="$HOME/.config/foot"

# Create the directory if it doesn't exist
mkdir -p "$CONFIG_DIR"

# Copy the foot.ini file
cp "$SCRIPT_DIR"/.config/foot/* $CONFIG_DIR

echo "Successfully configured foot."
