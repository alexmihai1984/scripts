#!/bin/bash

set -e

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

# Define config directory
CONFIG_DIR="$HOME/.config/i3"

# Copy the config file
cp "$SCRIPT_DIR"/../.config/i3/config $CONFIG_DIR

echo "Successfully configured i3."
