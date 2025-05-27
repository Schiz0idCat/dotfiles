#!/bin/bash

if ! command -v dolphin >/dev/null 2>&1; then
    echo "Installing Dolphin file manager..."

    if ! sudo pacman -S --noconfirm dolphin; then
        echo "Error: Failed to install Dolphin. Aborting."
        exit 1
    fi
fi
echo "Dolphin installed."
