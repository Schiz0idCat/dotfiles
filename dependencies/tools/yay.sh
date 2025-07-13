#!/bin/bash

if ! command -v yay >/dev/null 2>&1; then
    echo "Installing yay from AUR..."

    if ! command -v git >/dev/null 2>&1 || ! command -v makepkg >/dev/null 2>&1; then
        echo "Installing base-devel and git..."
        if ! sudo pacman -S --noconfirm base-devel git; then
            echo "Error: failed to install base-devel or git. Aborting."
            exit 1
        fi
    fi

    tempdir=$(mktemp -d)
    git clone https://aur.archlinux.org/yay.git "$tempdir/yay"
    cd "$tempdir/yay" || exit 1

    makepkg -si --noconfirm

    cd - >/dev/null
    rm -rf "$tempdir"
fi
echo "yay installed."
