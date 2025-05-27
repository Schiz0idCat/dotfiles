#!/bin/bash

if ! command -v yazi >/dev/null 2>&1; then
    echo "Installing Yazi..."

    if ! sudo pacman -S --noconfirm yazi; then
        echo "Error: failed to install Yazi. Aborting."
        exit 1
    fi
fi
echo "Yazi installed."
