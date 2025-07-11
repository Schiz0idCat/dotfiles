#!/bin/bash

if ! command -v fzf >/dev/null 2>&1; then
    echo "Installing fzf..."

    if ! sudo pacman -S --noconfirm fzf; then
        echo "Error: failed to install fzf. Aborting."
        exit 1
    fi
fi
echo "fzf installed."
