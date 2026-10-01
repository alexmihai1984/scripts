#!/bin/bash

sudo apt install rclone

rclone config

mkdir -p ~/GoogleDrive
rclone mount gdrive: ~/GoogleDrive --vfs-cache-mode full &

echo "Successfully configured rclone."
