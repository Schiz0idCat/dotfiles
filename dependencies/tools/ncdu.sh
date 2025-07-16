#!/bin/bash

if ! command -v ncdu >/dev/null 2>&1; then
    echo "Installing ncdu..."

    if ! sudo pacman -S --noconfirm ncdu; then
        echo "Error: failed to install ncdu. Aborting."
        exit 1
    fi
fi
echo "ncdu installed."
