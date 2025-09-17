#!/bin/bash

# Set font name (you can change this to any Nerd Font)
FONT_NAME="JetBrainsMono"
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/${FONT_NAME}.zip"
FONT_DIR="$HOME/.local/share/fonts/${FONT_NAME}"

# Create font directory
mkdir -p "$FONT_DIR"

# Download font zip
echo "Downloading $FONT_NAME Nerd Font..."
wget -q --show-progress "$FONT_URL" -O "/tmp/${FONT_NAME}.zip"

# Unzip to local fonts directory
echo "Installing $FONT_NAME to $FONT_DIR"
unzip -o "/tmp/${FONT_NAME}.zip" -d "$FONT_DIR"

# Refresh font cache
echo "Updating font cache..."
fc-cache -fv > /dev/null

# Verify installation
if fc-list | grep -i "$FONT_NAME" >/dev/null; then
    echo "✅ $FONT_NAME Nerd Font installed successfully!"
else
    echo "❌ Installation failed or font not found."
fi
