#!/bin/bash

TARGET="~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"

if [ ! -d "TARGET" ]; then
    echo "Installing zsh-syntax-highlighting..."

    if ! sudo pacman -S --noconfirm zsh-syntax-highlighting; then
        echo "Error: failed to install zsh-syntax-highlighting. Aborting."
        exit 1
    fi

    sudo mv /usr/share/zsh/plugins/zsh-syntax-highlighting "$TARGET"
fi
echo "zsh-syntax-highlighting installed."
