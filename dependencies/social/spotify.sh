#!/bin/bash

if ! command -v spotify-launcher >/dev/null 2>&1; then
    echo "Installing spotify-launcher..."

    if ! sudo pacman -S --noconfirm spotify-launcher; then
        echo "Error: failed to install spotify-launcher. Aborting."
        exit 1
    fi
    echo "spotify-launcher installed."
fi
echo "spotify-launcher already installed."
