#!/bin/bash

sudo pacman -Syu cups cups-filters cups-pdf system-config-printer print-manager
sudo systemctl enable --now cups.service
sudo systemctl enable --now avahi-daemon.service
