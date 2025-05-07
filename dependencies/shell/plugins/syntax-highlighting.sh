#!/bin/bash

if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    echo "Installing zsh-syntax-highlighting..."
    if ! git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
        "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"; then
        echo "Error: failed to clone zsh-syntax-highlighting. Aborting."
        exit 1
    fi
fi
echo "zsh-syntax-highlighting installed."
