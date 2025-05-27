#!/bin/bash

if ! command -v nvim >/dev/null 2>&1; then
    echo "Installing Neovim..."

    if ! sudo pacman -S --noconfirm neovim; then
        echo "Error: failed to install Neovim. Aborting."
        exit 1
    fi
fi
echo "Neovim installed."
