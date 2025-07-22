#!/bin/bash

FONT_PACKAGES=(
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    noto-fonts-extra
)

for pkg in "${FONT_PACKAGES[@]}"; do
    if ! pacman -Qq "$pkg" &>/dev/null; then
        echo "Installing $pkg..."

        if ! sudo pacman -S --noconfirm "$pkg"; then
            echo "ERROR: $pkg installation failed."
            exit 1
        fi
    else
        echo "$pkg installed."
    fi
done
