#!/bin/bash

if ! command -v gcc >/dev/null 2>&1; then
    echo "Installing GCC..."

    if ! sudo pacman -S --noconfirm gcc; then
        echo "Error: failed to install GCC. Aborting."
        exit 1
    fi
fi
echo "GCC installed."
