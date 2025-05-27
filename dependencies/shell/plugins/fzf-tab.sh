#!/bin/bash

if ! command -v fzf-tab >/dev/null 2>&1; then
    echo "Installing fzf-tab..."

    if ! command -v yay >/dev/null 2>&1; then
        echo "Error: yay is not installed. Please install yay first."
        exit 1
    fi

    if ! yay -S --noconfirm fzf-tab-source; then
        echo "Error: failed to install fzf-tab-source. Aborting."
        exit 1
    fi
fi
echo "fzf-tab installed."
