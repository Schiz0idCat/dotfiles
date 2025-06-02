#!/bin/bash

if ! pacman -Q xdg-desktop-portal-hyprland >/dev/null 2>&1; then
    echo "Installing xdg-desktop-portal-hyprland..."

    if ! sudo pacman -S --noconfirm xdg-desktop-portal-hyprland; then
        echo "Error: failed to install xdg-desktop-portal-hyprland. Aborting."
        exit 1
    fi
fi

echo "xdg-desktop-portal-hyprland installed."
