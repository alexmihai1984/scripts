#!/bin/bash

set -e

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

cp "$SCRIPT_DIR"/.config/.Xresources $HOME

CONFIG_DIR="$HOME/.config/gtk-3.0"

cp "$SCRIPT_DIR"/.config/gtk-3.0/settings.ini $CONFIG_DIR

echo "Successfully configured cursor."