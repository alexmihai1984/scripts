#!/bin/bash
# --- OMV pre-shutdown cleanup ---
LOGFILE="/var/log/omv-pre-shutdown.log"
echo "$(date): Stopping Samba sessions..." >> "$LOGFILE"

# Stop Samba, NetBIOS and Docker services
systemctl stop smbd nmbd docker

# Give them a moment to exit cleanly
sleep 2

# Optionally, check if any are still running
pgrep smbd >> "$LOGFILE" || echo "All smbd stopped" >> "$LOGFILE"
