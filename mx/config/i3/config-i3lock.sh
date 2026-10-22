#!/bin/bash

set -e

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

# Define config directory
CONFIG_DIR="$HOME/.config/i3lock"

mkdir -p $CONFIG_DIR

# Copy the config file
cp "$SCRIPT_DIR"/.config/i3lock/lock-screen.sh $CONFIG_DIR

echo "Successfully configured i3lock."
