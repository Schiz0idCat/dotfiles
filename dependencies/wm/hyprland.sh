#!/bin/bash

if ! command -v Hyprland >/dev/null 2>&1; then
    echo "Installing Hyprland..."

    if ! sudo pacman -S --noconfirm hyprland; then
        echo "Error: failed to install Hyprland. Aborting."
        exit 1
    fi
fi
echo "Hyprland installed."
