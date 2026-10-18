#!/bin/bash

set -e

mkdir -p ~/.local/share/applications

cp /usr/share/applications/com.visualstudio.CodeOSS.desktop \
   ~/.local/share/applications/

sed -i 's|^Exec=/usr/share/codium/codium|Exec=/usr/share/codium/codium --password-store=gnome-libsecret|' \
  ~/.local/share/applications/com.visualstudio.CodeOSS.desktop

echo "Successfully configured codium launcher."
