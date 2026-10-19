#!/bin/bash

set -e

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

# Define config directory
CONFIG_DIR="$HOME/.config/xsettingsd"

mkdir -p $CONFIG_DIR

# Copy the xsettingsd.conf file
cp "$SCRIPT_DIR"/.config/xsettingsd/* $CONFIG_DIR

echo "Successfully configured xsettingsd."
