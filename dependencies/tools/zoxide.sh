#!/bin/bash

if ! command -v zoxide >/dev/null 2>&1; then
    echo "Installing zoxide..."

    if ! sudo pacman -S --noconfirm zoxide; then
        echo "Error: failed to install zoxide. Aborting."
        exit 1
    fi
fi
echo "zoxide installed."
