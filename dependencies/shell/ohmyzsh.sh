#!/bin/bash

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."

    if ! command -v curl >/dev/null 2>&1; then
        chmod +x ../tools/curl.sh
        bash ../tools/curl.sh        
    fi 

    if ! sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"; then
        echo "Error: failed to install Oh My Zsh. Aborting."
        exit 1
    fi
fi
echo "Oh My Zsh installed."
