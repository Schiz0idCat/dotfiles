#!/bin/bash

if ! command -v wget >/dev/null 2>&1; then
    echo "Installing wget..."

    if ! sudo pacman -S --noconfirm wget; then
        echo "Error: failed to install wget. Aborting."
        exit 1
    fi
fi
echo "wget installed."
