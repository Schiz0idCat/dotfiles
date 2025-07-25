#!/bin/bash

if [ ! -d "$HOME/.config/oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."

    if ! sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"; then
        echo "Error: failed to install Oh My Zsh. Aborting."
        exit 1
    fi
fi
echo "Oh My Zsh installed."
