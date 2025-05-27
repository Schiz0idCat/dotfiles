#!/bin/bash

if [ ! -d "/usr/share/zsh/plugins/zsh-syntax-highlighting" ]; then
    echo "Installing zsh-syntax-highlighting..."

    if ! sudo pacman -S --noconfirm zsh-syntax-highlighting; then
        echo "Error: failed to install zsh-syntax-highlighting. Aborting."
        exit 1
    fi
fi
echo "zsh-syntax-highlighting installed."
