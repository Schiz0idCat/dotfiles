#!/bin/bash

if ! command -v hypridle >/dev/null 2>&1; then
    echo "Installing hypridle..."

    if ! sudo pacman -S --noconfirm hypridle; then
        echo "Error: failed to install hypridle. Aborting."
        exit 1
    fi
fi
echo "hypridle installation complete."
