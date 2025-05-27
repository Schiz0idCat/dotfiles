#!/bin/bash

if ! command -v gh >/dev/null 2>&1; then
    echo "Installing GitHub CLI..."

    if ! sudo pacman -S --noconfirm github-cli; then
        echo "Error: failed to install GitHub CLI. Aborting."
        exit 1
    fi
fi
echo "GitHub CLI installed."
