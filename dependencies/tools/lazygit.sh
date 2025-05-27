#!/bin/bash

if ! command -v lazygit >/dev/null 2>&1; then
    echo "Installing Lazygit..."

    if ! sudo pacman -S --noconfirm lazygit; then
        echo "Error: failed to install Lazygit. Aborting."
        exit 1
    fi
fi
echo "Lazygit installed."
