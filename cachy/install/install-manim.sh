#!/bin/bash

# uv is a tool for managing multiple versions of Python and other programming languages.
curl -LsSf https://astral.sh/uv/install.sh | sh

# python
uv python install

# latex
sudo pacman -S texlive-latex texlive-meta --noconfirm

# manim dependencies
sudo pacman -S base-devel cairo pango --noconfirm
