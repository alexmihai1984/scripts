#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

# 1. Dynamically locate the directory where this script actually lives
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

CONFIG_FILE="${SCRIPT_DIR}/10-customization-screen"
TARGET_DIR="/etc/dconf/db/gdm.d"
PROFILE_DIR="/etc/dconf/profile"
GDM_PROFILE="${PROFILE_DIR}/gdm"

# 2. Ensure the script is run with sudo
if [ "$EUID" -ne 0 ]; then
  echo "Error: Please run this script with sudo." >&2
  exit 1
fi

# 3. Check if the configuration file exists in the script's directory
if [ ! -f "$CONFIG_FILE" ]; then
  echo "Error: '10-customization-screen' not found at: $CONFIG_FILE" >&2
  exit 1
fi

# 4. Create the GDM dconf directory structure if it doesn't exist
echo "Creating system configuration directories..."
mkdir -p "$TARGET_DIR"
mkdir -p "$PROFILE_DIR"

# 5. Create or verify the GDM profile safely
if [ ! -f "$GDM_PROFILE" ]; then
  echo "GDM profile not found. Creating a new one..."
  cat << 'EOF' > "$GDM_PROFILE"
user-db:user
system-db:gdm
file-db:/usr/share/gdm/greeter-dconf-defaults
EOF
else
  echo "GDM profile already exists. Verifying profile database hooks..."
  # If the file exists but lacks 'system-db:gdm' for some reason, append it safely
  if ! grep -q "system-db:gdm" "$GDM_PROFILE"; then
    echo "Appending system-db:gdm hooks to existing profile configuration..."
    echo "system-db:gdm" >> "$GDM_PROFILE"
  fi
fi

# 6. Copy the customization profile into place
echo "Deploying login screen customization profile..."
cp "$CONFIG_FILE" "$TARGET_DIR/"

# 7. Compile and update the system dconf databases
echo "Updating system dconf database..."
dconf update

echo "Success! Please log out or restart your computer to see the changes."
