#!/bin/bash

if ! command -v discord >/dev/null 2>&1; then
    echo "Installing Discord..."

    if ! sudo pacman -S --noconfirm discord; then
        echo "Error: failed to install Discord. Aborting."
        exit 1
    fi
fi

echo "Discord installed."
