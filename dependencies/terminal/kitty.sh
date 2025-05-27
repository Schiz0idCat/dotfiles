#!/bin/bash

if ! command -v kitty >/dev/null 2>&1; then
    echo "Installing kitty..."

    if ! sudo pacman -S --noconfirm kitty; then
        echo "Error: failed to install kitty. Aborting."
        exit 1
    fi
fi
echo "kitty installed."
