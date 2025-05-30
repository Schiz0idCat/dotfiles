#!/bin/bash

if ! pacman -Q capitaine-cursors &>/dev/null; then
    echo "Installing Capitaine Cursors..."

    if ! sudo pacman -S --noconfirm capitaine-cursors; then
        echo "Error: failed to install Capitaine Cursors. Aborting."
        exit 1
    fi

    sudo rm -rf /usr/share/icons/capitaine-cursors-light/
fi

echo "Capitaine Cursors installed."
