#!/bin/bash
set -e

OVERRIDE_DIR="/etc/systemd/system/umount.target.d"
OVERRIDE_FILE="$OVERRIDE_DIR/override.conf"

sudo cp ./omv-pre-shutdown.sh /usr/local/sbin/

sudo chmod +x /usr/local/sbin/omv-pre-shutdown.sh

echo "Setting up systemd override..."
sudo mkdir -p "$OVERRIDE_DIR"
sudo tee "$OVERRIDE_FILE" >/dev/null <<EOF
[Service]
ExecStartPre=$SCRIPT_PATH
EOF

echo "Reloading systemd..."

sudo systemctl daemon-reload

echo "Done."