#!/bin/bash

if ! command -v sddm >/dev/null 2>&1; then
    echo "Installing sddm..."

    if ! sudo pacman -S --noconfirm sddm; then
        echo "Error: failed to install sddm. Aborting."
        exit 1
    fi

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

# configuration part
THEME_NAME="schiz0id"
THEME_DIR="/usr/share/sddm/themes/$THEME_NAME"
CONFIG_FILE="/etc/sddm.conf"
DOTFILES_DIR="$HOME/dotfiles/sddm"

sudo mkdir -p "$THEME_DIR"
sudo cp -r "$DOTFILES_DIR"/* "$THEME_DIR"

sudo touch "$CONFIG_FILE"

if grep -q "^\[Theme\]" "$CONFIG_FILE"; then
    sudo sed -i "/^\[Theme\]/,/^\[.*\]/ {s/^Current=.*/Current=$THEME_NAME/}" "$CONFIG_FILE"

    if ! sed -n "/^\[Theme\]/,/^\[.*\]/p" "$CONFIG_FILE" | grep -q "^Current="; then
        sudo sed -i "/^\[Theme\]/a Current=$THEME_NAME" "$CONFIG_FILE"
    fi
else
    echo -e "\n[Theme]\nCurrent=$THEME_NAME" | sudo tee -a "$CONFIG_FILE" > /dev/null
fi

sudo systemctl disable display-manager.service 2>/dev/null
sudo systemctl enable sddm.service &> /dev/null
