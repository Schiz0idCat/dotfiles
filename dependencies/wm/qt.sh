#!/bin/bash

DEPENDENCIES=(
    qt6-base
    qt6-svg
    qt6-multimedia-ffmpeg
)

for package in "${DEPENDENCIES[@]}"; do
    if ! pacman -Q "$package" >/dev/null 2>&1; then
        echo "Installing $package..."

        if ! sudo pacman -S --noconfirm "$package"; then
            echo "Error: failed to install $package. Aborting."
            exit 1
        fi
    else
        echo "$package installed."
    fi
done
