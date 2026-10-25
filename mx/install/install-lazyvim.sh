#!/bin/bash

set -e

# nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz

sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
echo 'export PATH="/opt/nvim-linux-x86_64/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

sudo rm nvim-linux-x86_64.tar.gz

# lazyvim
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

CONFIG_DIR="$HOME/.config/nvim"

# Create the directory if it doesn't exist
mkdir -p "$CONFIG_DIR"

# Copy the config dir
rsync -a "$SCRIPT_DIR"/../../common/config/.config/nvim/ "$CONFIG_DIR"/

# Plugins
sudo apt install wl-clipboard -y

sudo apt install python3-pynvim -y

sudo apt install lazygit -y

sudo apt install tree-sitter-cli -y

npm install -g @mermaid-js/mermaid-cli

echo "Successfully configured lazyvim."
