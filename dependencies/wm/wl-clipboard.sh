#!/bin/bash

if ! command -v wl-copy >/dev/null 2>&1; then
    echo "Installing wl-clipboard..."

    if ! sudo pacman -S --noconfirm wl-clipboard; then
        echo "Error: failed to install wl-clipboard. Aborting."
        exit 1
    fi
fi
echo "wl-clipboard installed."
