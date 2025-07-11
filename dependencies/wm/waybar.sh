#!/bin/bash

if ! command -v waybar >/dev/null 2>&1; then
    echo "Installing waybar..."

    if ! sudo pacman -S --noconfirm waybar; then
        echo "Error: failed to install waybar. Aborting."
        exit 1
    fi
fi
echo "waybar installed."
