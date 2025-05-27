#!/bin/bash

if ! command -v fd >/dev/null 2>&1; then
    echo "Installing fd..."

    if ! sudo pacman -S --noconfirm fd; then
        echo "Error: failed to install fd. Aborting."
        exit 1
    fi
fi
echo "fd installed."
