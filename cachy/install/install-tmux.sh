#!/bin/bash

sudo pacman -S tmux --noconfirm

# install tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp ../config/tmux.conf ~/.tmux.conf