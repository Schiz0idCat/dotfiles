#!/bin/bash

if ! command -v libreoffice >/dev/null 2>&1; then
    echo "Installing LibreOffice..."

    if ! sudo pacman -S --noconfirm libreoffice-fresh; then
        echo "Error: failed to install LibreOffice. Aborting."
        exit 1
    fi
fi

echo "LibreOffice installed."
