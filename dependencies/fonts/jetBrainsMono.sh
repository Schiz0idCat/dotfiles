#!/bin/bash

if ! fc-list | grep -iq "JetBrainsMono Nerd"; then
    echo "Installing JetBrains Mono Nerd Font..."

    if ! sudo pacman -S --noconfirm ttf-jetbrains-mono-nerd; then
        echo "ERROR: ttf-jetbrains-mono-nerd installation failed."
        exit 1
    fi
fi
echo "JetBrains Mono Nerd Font installed."
