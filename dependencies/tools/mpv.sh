#!/bin/bash

if ! command -v mpv >/dev/null 2>&1; then
    echo "Installing mpv..."

    if ! sudo pacman -S --noconfirm mpv; then
        echo "Error: failed to install mpv. Aborting."
        exit 1
    fi
fi

echo "mpv installed."
