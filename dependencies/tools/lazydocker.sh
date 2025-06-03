#!/bin/bash

if ! command -v lazydocker >/dev/null 2>&1; then
    echo "Installing lazydocker..."

    if ! yay -S --noconfirm lazydocker; then
        echo "Error: failed to install lazydocker. Aborting."
        exit 1
    fi
fi

echo "lazydocker installed."
