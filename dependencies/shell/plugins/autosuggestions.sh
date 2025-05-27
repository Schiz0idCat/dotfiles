#!/bin/bash

if [ ! -d "/usr/share/zsh/plugins/zsh-autosuggestions" ]; then
    echo "Installing zsh-autosuggestions..."

    if ! sudo pacman -S --noconfirm zsh-autosuggestions; then
        echo "Error: failed to install zsh-autosuggestions. Aborting."
        exit 1
    fi
fi
echo "zsh-autosuggestions installed."
