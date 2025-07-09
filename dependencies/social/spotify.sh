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

if ! command -v spicetify >/dev/null 2>&1; then
    echo "Installing spicetify..."

    if ! curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh; then
        echo "Error: failed to install spicetify. Aborting."
        exit 1
    fi
    echo "spicetify installed."
fi
echo "spicetify already installed."
