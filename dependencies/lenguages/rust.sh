#!/bin/bash

if ! command -v rustup >/dev/null 2>&1; then
    echo "Installing Rust (rustup via pacman)..."

    if ! sudo pacman -S --noconfirm rustup; then
        echo "Error: failed to install rustup. Aborting."
        exit 1
    fi

    rustup default stable
fi
echo "Rust (rustup) installed."
