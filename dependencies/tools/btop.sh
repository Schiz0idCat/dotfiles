#!/bin/bash

if ! command -v btop >/dev/null 2>&1; then
    echo "Installing btop..."

    if ! sudo pacman -S --noconfirm btop; then
        echo "Error: failed to install btop. Aborting."
        exit 1
    fi
fi
echo "btop installed."
