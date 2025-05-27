#!/bin/bash

if ! command -v unzip >/dev/null 2>&1; then
    echo "Installing unzip..."

    if ! sudo pacman -S --noconfirm unzip; then
        echo "Error: failed to install unzip. Aborting."
        exit 1
    fi
fi
echo "unzip installed."
