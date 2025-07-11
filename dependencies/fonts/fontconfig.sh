#!/bin/bash

if ! pacman -Qs fontconfig >/dev/null 2>&1; then
    echo "Installing fontconfig..."

    if ! sudo pacman -S --noconfirm fontconfig; then
        echo "Error: failed to install fontconfig. Aborting."
        exit 1
    fi
fi
echo "fontconfig installed."
