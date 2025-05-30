#!/bin/bash

if ! command -v sddm >/dev/null 2>&1; then
    echo "Installing sddm..."

    if ! sudo pacman -S --noconfirm sddm; then
        echo "Error: failed to install sddm. Aborting."
        exit 1
    fi

    sudo systemctl enable sddm.service

    # latam keyboard
    XSETUP_PATH="/usr/share/sddm/scripts/Xsetup"
    if ! grep -Fxq "setxkbmap latam" "$XSETUP_PATH"; then
        echo "setxkbmap latam" | sudo tee -a "$XSETUP_PATH" >/dev/null
    fi

    # set profile picture
    ln -sf ~/dotfiles/images/profile/black_cat.png ~/.face.icon

    setfacl -m u:sddm:x /home/username
    setfacl -m u:sddm:r /home/username/.face.icon
fi
echo "sddm installed."
