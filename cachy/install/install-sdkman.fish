#!/usr/bin/fish

# 1. Update system and install SDKMAN dependencies
sudo pacman -Syu curl unzip zip --noconfirm

# 2. Install the SDKMAN "Engine" (if not already there)
if not test -d "$HOME/.sdkman"
    echo "⚙️ Installing the SDKMAN engine..."
    curl -s "https://get.sdkman.io" | bash
end

# 3. Install Fisher (if not already there)
if not functions -q fisher
    echo "📦 Installing Fisher..."
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
end

# 4. Install the Correct Plugin (the one you found!)
echo "🐟 Installing the Fish-SDKMAN bridge..."
fisher install reitzig/sdkman-for-fish

# 5. Activate it for the current session
# This plugin creates a file called 'sdk.fish' in your conf.d
if test -f "$__fish_config_dir/conf.d/sdk.fish"
    source "$__fish_config_dir/conf.d/sdk.fish"
    echo "✅ Setup complete! Testing..."
    sdk version
else
    # Some versions of fisher might name the config file 'sdkman.fish'
    # Let's try to find it just in case
    source $__fish_config_dir/conf.d/*.fish
    sdk version
end