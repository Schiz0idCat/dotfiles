#!/bin/bash

if ! command -v wofi >/dev/null 2>&1; then
    echo "Installing wofi..."

    if ! sudo pacman -S --noconfirm wofi; then
        echo "Error: failed to install wofi. Aborting."
        exit 1
    fi
fi
echo "wofi installed."
