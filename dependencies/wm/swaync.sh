#!/bin/bash

if ! command -v swaync >/dev/null 2>&1; then
    echo "Installing swaync with pacman..."

    if ! sudo pacman -S --noconfirm swaync; then
        echo "Error: failed to install swaync. Aborting."
        exit 1
    fi
fi
echo "swaync installed."
