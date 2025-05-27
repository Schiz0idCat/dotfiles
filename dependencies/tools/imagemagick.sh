#!/bin/bash

if ! command -v convert >/dev/null 2>&1; then
    echo "Installing ImageMagick..."

    if ! sudo pacman -S --noconfirm imagemagick; then
        echo "Error: failed to install ImageMagick. Aborting."
        exit 1
    fi
fi
echo "ImageMagick installed."
