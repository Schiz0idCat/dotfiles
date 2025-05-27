#!/bin/bash

if ! command -v npm >/dev/null 2>&1; then
    echo "Installing npm..."

    if ! sudo pacman -S --noconfirm npm; then
        echo "Error: failed to install npm. Aborting."
        exit 1
    fi
fi
echo "npm installed."
