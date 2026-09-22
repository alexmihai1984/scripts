#!/usr/bin/fish

# 1. Install Fisher if missing
if not functions -q fisher
    echo "📦 Installing Fisher..."
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
end

# 2. Install the Fish NVM plugin
echo "🐟 Installing NVM for Fish..."
fisher install jorgebucaran/nvm.fish

# 3. Install Node LTS
# We 'source' the plugin immediately so the script can use 'nvm' right away
source $__fish_config_dir/conf.d/nvm.fish
echo "🚀 Installing Node LTS..."
nvm install lts
set --universal nvm_default_version lts

echo "✅ All done! Try running 'node -v' now."