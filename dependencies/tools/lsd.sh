#!/bin/bash

if ! command -v lsd >/dev/null 2>&1; then
    echo "Installing lsd..."

    if ! sudo pacman -S --noconfirm lsd; then
        echo "Error: failed to install lsd. Aborting."
        exit 1
    fi
fi
echo "lsd installed."
