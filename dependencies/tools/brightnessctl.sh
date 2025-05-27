#!/bin/bash

if ! command -v brightnessctl >/dev/null 2>&1; then
    echo "Installing brightnessctl..."

    if ! sudo pacman -S --noconfirm brightnessctl; then
        echo "Error: failed to install brightnessctl. Aborting."
        exit 1
    fi
fi
echo "brightnessctl installed."
