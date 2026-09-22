#!/bin/bash

# Rust is installed by default, but that is not the preferred way to install it. It tries to use a linker path that's not present in Arch.
# See: https://discuss.cachyos.org/t/rust-error-linker-x86-64-linux-gnu-gcc-not-found-solution/35375
sudo pacman -R rust --noconfirm
sudo pacman -S rustup --noconfirm
rustup default stable
