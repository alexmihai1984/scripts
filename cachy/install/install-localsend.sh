#!/bin/bash

sudo pacman -S localsend --noconfirm

sudo ufw allow 53317/tcp
sudo ufw allow 53317/udp
sudo ufw reload
