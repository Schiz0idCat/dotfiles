#!/bin/bash

if ! command -v hyprlock >/dev/null 2>&1; then
    echo "Installing hyprlock..."

    if ! sudo pacman -S --noconfirm hyprlock; then
        echo "Error: failed to install hyprlock. Aborting."
        exit 1
    fi
fi

echo "Hyprlock installation complete."
