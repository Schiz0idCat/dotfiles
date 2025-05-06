#!/bin/bash

if ! command -v zsh >/dev/null 2>&1; then
    echo "Installing zsh..."
    sudo apt install -y zsh || {
        echo "Error: zsh installation failed. Aborting."
        exit 1
    }
fi
echo "zsh installed."
