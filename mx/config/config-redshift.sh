#!/bin/bash

set -e

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

# Define config directory
CONFIG_DIR="$HOME/.config"

# Copy the redshift.conf file
cp "$SCRIPT_DIR"/.config/redshift.conf $CONFIG_DIR

echo "Successfully configured redshift."
