#!/usr/bin/fish

# 1. Install Angular CLI
echo "🅰️  Installing Angular CLI..."
# We use 'npm' from the newly installed Node
npm install -g @angular/cli

# 2. Silence Google Analytics
echo "🤫 Disabling Angular Analytics..."
# This uses the 'ng' command we just installed
# We use 'npx' here just to be 100% sure it finds the binary
npx @angular/cli config --global cli.analytics "false"

echo "✅ All done! Try running 'ng version' now."