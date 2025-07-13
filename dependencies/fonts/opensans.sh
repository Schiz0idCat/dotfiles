#!/bin/bash

if ! fc-list | grep -iq "Open Sans"; then
    echo "Installing Open Sans Font..."

    if ! sudo pacman -S --noconfirm ttf-opensans; then
        echo "ERROR: ttf-opensans installation failed."
        exit 1
    fi
fi
echo "Open Sans Font installed."
