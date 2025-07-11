#!/bin/bash

if ! command -v go >/dev/null 2>&1; then
    echo "Installing Go..."

    if ! sudo pacman -S --noconfirm go; then
        echo "Error: failed to install Go. Aborting."
        exit 1
    fi
fi
echo "Go installed."
