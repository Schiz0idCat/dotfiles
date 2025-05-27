#!/bin/bash

FLAG="~/dotfiles/dependencies/grub/flag.txt"

if [[ "$(head -n 1 "$FLAG")" == "1" ]]; then
    echo "grub configured."
    exit 0
fi

echo "Configuring GRUB theme..."

THEME_REPO="https://github.com/sandesh236/sleek--themes.git"
THEME_DIR="$HOME/sleek--themes"
THEME_NAME="Sleek theme-dark"
INSTALL_SCRIPT="$THEME_DIR/$THEME_NAME/install.sh"

GRUB_CFG="/boot/grub/grub.cfg"
GRUB_UPDATE_CMD="sudo grub-mkconfig -o $GRUB_CFG"

if ! command -v git >/dev/null 2>&1; then
  echo "Git not found. Installing git..."
  if ! sudo pacman -S --noconfirm git; then
    echo "Error: failed to install git. Aborting."
    exit 1
  fi
fi

if [ ! -d "$THEME_DIR" ]; then
  echo "Cloning the GRUB theme repository..."
  git clone "$THEME_REPO" "$THEME_DIR"
fi

if [ ! -f "$INSTALL_SCRIPT" ]; then
  echo "Error: install.sh not found in $THEME_NAME"
  exit 1
fi

cd "$THEME_DIR/$THEME_NAME"
chmod +x install.sh
echo "Running installation script for '$THEME_NAME'..."
sudo ./install.sh

echo "1" > "$FILE"
