#!/bin/bash

set -e

sudo pacman -S neovim --noconfirm

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

CONFIG_DIR="$HOME/.config/nvim"

# Create the directory if it doesn't exist
mkdir -p "$CONFIG_DIR"

# Copy the config dir
rsync -a "$SCRIPT_DIR"/../../common/config/.config/nvim/ "$CONFIG_DIR"/

sudo pacman -S wl-clipboard --noconfirm

sudo pacman -S python-pynvim --noconfirm

sudo pacman -S lazygit --noconfirm

sudo pacman -S tree-sitter --noconfirm
sudo pacman -S tree-sitter-cli --noconfirm

sudo pacman -S mermaid-cli --noconfirm

echo "Successfully configured lazyvim."

