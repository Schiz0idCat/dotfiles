#!/bin/bash

TARGET="${ZSH_CUSTOM:-$HOME/.config/oh-my-zsh/custom}/plugins/fzf-tab"

if [ ! -d "$TARGET" ] >/dev/null 2>&1; then
    echo "Installing fzf-tab..."

    if ! command -v yay >/dev/null 2>&1; then
        echo "Error: yay is not installed. Please install yay first."
        exit 1
    fi

    if ! yay -S --noconfirm fzf-tab-source; then
        echo "Error: failed to install fzf-tab-source. Aborting."
        exit 1
    fi

    sudo mv /usr/share/zsh/plugins/fzf-tab-source "$TARGET"
fi
echo "fzf-tab installed."
