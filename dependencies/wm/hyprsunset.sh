#!/bin/bash

if ! command -v hyprsunset >/dev/null 2>&1; then
    echo "Installing hyprsunset..."

    if ! sudo pacman -S --noconfirm hyprsunset; then
        echo "Error: failed to install hyprsunset. Aborting."
        exit 1
    fi
fi
echo "hyprsunset installation complete."
