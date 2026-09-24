#!/bin/bash

set -e

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

# Define config directory and file path
CONFIG_DIR="$HOME/.config/fish"

# Create the directory if it doesn't exist
mkdir -p "$CONFIG_DIR"

cp "$SCRIPT_DIR"/.config/fish/functions/* "$CONFIG_DIR"/functions/

echo "Successfully configured fish."
