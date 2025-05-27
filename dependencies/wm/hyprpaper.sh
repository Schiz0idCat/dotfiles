#!/bin/bash

if ! command -v hyprpaper >/dev/null 2>&1; then
    echo "Installing hyprpaper..."

    if ! sudo pacman -S --noconfirm hyprpaper; then
        echo "Error: failed to install hyprpaper. Aborting."
        exit 1
    fi
fi
echo "hyprpaper installation complete."
