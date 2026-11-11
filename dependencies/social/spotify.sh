#!/bin/bash

if ! command -v spotify-launcher >/dev/null 2>&1; then
    echo "Installing spotify..."

    if ! sudo pacman -S --noconfirm spotify-launcher; then
        echo "Error: failed to install spotify. Aborting."
        exit 1
    fi
fi

echo "spotify installed."
