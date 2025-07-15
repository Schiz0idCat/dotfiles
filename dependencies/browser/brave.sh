#!/bin/bash

if ! command -v brave >/dev/null 2>&1; then
    echo "Installing Brave Browser..."

    if ! yay -Sy --noconfirm brave-bin; then
        echo "Error: failed to install Brave Browser. Aborting."
        exit 1
    fi
fi
echo "Brave Browser installed."
