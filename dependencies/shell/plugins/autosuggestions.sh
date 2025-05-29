#!/bin/bash

TARGET="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

if [ ! -d "$TARGET" ]; then
    echo "Installing zsh-autosuggestions..."

    if ! sudo pacman -S --noconfirm zsh-autosuggestions; then
        echo "Error: failed to install zsh-autosuggestions. Aborting."
        exit 1
    fi

    sudo mv /usr/share/zsh/plugins/zsh-autosuggestions "$TARGET"
fi
echo "zsh-autosuggestions installed."
