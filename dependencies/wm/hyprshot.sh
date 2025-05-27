#!/bin/bash

if ! command -v hyprshot >/dev/null 2>&1; then
    echo "Installing hyprshot from AUR..."

    if ! command -v yay >/dev/null 2>&1; then
        echo "Error: yay is not installed. Please install yay first."
        exit 1
    fi

    if ! yay -S --noconfirm hyprshot; then
        echo "Error: failed to install hyprshot. Aborting."
        exit 1
    fi
fi
echo "hyprshot installed."
