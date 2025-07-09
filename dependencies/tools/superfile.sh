#!/bin/bash

if ! command -v spf >/dev/null 2>&1; then
    echo "Installing Superfile..."

    if ! sudo pacman -S --noconfirm superfile; then
        echo "Error: failed to install Superfile. Aborting."
        exit 1
    fi
fi
echo "Superfile installed."
