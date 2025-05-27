#!/bin/bash

if ! command -v oh-my-posh >/dev/null 2>&1; then
    echo "Installing Oh My Posh..."

    if ! command -v yay >/dev/null 2>&1; then
        echo "Error: yay no está instalado. Por favor instala yay primero."
        exit 1
    fi

    if ! yay -S --noconfirm oh-my-posh; then
        echo "Error: failed to install Oh My Posh. Aborting."
        exit 1
    fi
fi
echo "Oh My Posh installed."
