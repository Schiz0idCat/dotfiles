#!/bin/bash

if ! command -v fastfetch >/dev/null 2>&1; then
    echo "Installing fastfetch..."

    if ! sudo pacman -S --noconfirm fastfetch; then
        echo "Error: failed to install fastfetch. Aborting."
        exit 1
    fi
fi
echo "fastfetch installed."
