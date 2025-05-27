#!/bin/bash

if ! command -v curl >/dev/null 2>&1; then
    echo "Installing curl..."

    if ! sudo pacman -S --noconfirm curl; then
        echo "Error: failed to install curl. Aborting."
        exit 1
    fi
fi
echo "curl installed."
