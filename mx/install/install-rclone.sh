#!/bin/bash

sudo apt install -y rclone fuse3

# To set up Google Drive:
# Run: rclone config
# n) New remote
# name> gdrive
# storage type: Google Drive
#
# It will ask to authenticate with google. After, test:
# rclone lsd gdrive:
# rclone ls gdrive:
#
# Then mount:
# mkdir -p ~/GoogleDrive
#
# rclone mount gdrive: ~/GoogleDrive \
#     --vfs-cache-mode full \
#     --dir-cache-time 1h

# To make it persist between restarts, make it a service. Create ~/.config/systemd/user/rclone-gdrive.service:
# [Unit]
# Description=Google Drive via rclone
# After=network-online.target
# Wants=network-online.target

# [Service]
# Type=simple
# ExecStart=/usr/bin/rclone mount gdrive: %h/GoogleDrive \
#     --vfs-cache-mode full \
#     --dir-cache-time 1h
# ExecStop=/bin/fusermount3 -u %h/GoogleDrive
# Restart=on-failure
# RestartSec=5

# [Install]
# WantedBy=default.target
