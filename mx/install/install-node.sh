#!/bin/bash

set -e

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.8/install.sh | bash

source "$HOME/.nvm/nvm.sh"

nvm install 22
nvm use 22
nvm alias default 22
