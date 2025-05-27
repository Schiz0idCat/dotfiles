#!/bin/bash

if ! command -v zsh >/dev/null 2>&1; then
    echo "Installing zsh..."

    if ! sudo pacman -S --noconfirm zsh; then
        echo "Error: zsh installation failed. Aborting."
        exit 1
    fi
fi
echo "zsh installed."
