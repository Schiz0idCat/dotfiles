#!/bin/bash

echo "Cunfiguring grub..."

THEME_REPO="https://github.com/vinceliuice/grub2-themes.git"
THEME_DIR="$HOME/grub2-themes"
GRUB_CFG="/boot/grub/grub.cfg"
GRUB_UPDATE_CMD="sudo grub-mkconfig -o $GRUB_CFG"
GRUB_INSTALL_DIR="/boot/grub/themes/"
GRUB_DEFAULT="/etc/default/grub"
THEME_NAME="tela"


if [ ! -d "$THEME_DIR" ]; then
  git clone $THEME_REPO $THEME_DIR
else
  cd $THEME_DIR && git pull
fi

cd $THEME_DIR

sudo ./install.sh \
  -t tela \
  -i color \
  -s 1080p \
  -c 1920x1080 \
  -b \
  -g

if grep -q "GRUB_THEME" $GRUB_DEFAULT; then
  sudo sed -i "s|#\?GRUB_THEME=.*|GRUB_THEME=/boot/grub/themes/$THEME_NAME/theme.txt|" $GRUB_DEFAULT
else
  echo "GRUB_THEME=/boot/grub/themes/$THEME_NAME/theme.txt" | sudo tee -a $GRUB_DEFAULT > /dev/null
fi

$GRUB_UPDATE_CMD

echo "Grub configured..."
