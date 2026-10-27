#!/bin/bash

set -euo pipefail

REPO="zellij-org/zellij"
ASSET="zellij-x86_64-unknown-linux-musl.tar.gz"
INSTALL_DIR="/usr/local/bin"

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

echo "Fetching latest Zellij release..."

curl -fsSL \
    "https://api.github.com/repos/${REPO}/releases/latest" \
    -o "$TMP_DIR/release.json"

DOWNLOAD_URL="$(
    grep -oE '"browser_download_url": *"[^"]+"' "$TMP_DIR/release.json" |
    cut -d '"' -f 4 |
    grep "/${ASSET}$" |
    head -n 1
)"

if [[ -z "$DOWNLOAD_URL" ]]; then
    echo "Error: Could not find the release asset: $ASSET"
    exit 1
fi

echo "Downloading Zellij..."
curl -fL "$DOWNLOAD_URL" -o "$TMP_DIR/$ASSET"

tar -xzf "$TMP_DIR/$ASSET" -C "$TMP_DIR"

if [[ ! -f "$TMP_DIR/zellij" ]]; then
    echo "Error: Zellij binary not found in archive."
    exit 1
fi

echo "Installing to $INSTALL_DIR (sudo required)..."
sudo install -m 755 "$TMP_DIR/zellij" "$INSTALL_DIR/zellij"

echo
echo "Installation successful!"
zellij --version
echo
echo "Launch Zellij with: zellij"
