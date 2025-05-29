#!/bin/bash

if ! command -v spotify >/dev/null 2>&1; then
    echo "Installing Spotify..."

    if ! yay -S --noconfirm spotify; then
        echo "Error: failed to install Spotify. Aborting."
        exit 1
    fi
fi

echo "Spotify installed."
