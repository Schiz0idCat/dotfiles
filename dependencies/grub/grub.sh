#!/bin/bash

GRUB_DIR="/usr/share/grub/themes"
USER="demian"
THEME_DIR="/home/$USER/dotfiles/grub"
NAME="dark-grub"

if [[ $EUID -ne 0 ]]; then
  echo "Error: You must run this script as root or using sudo." >&2
  exit 1
fi

#=====>   clean directory and put the theme   <=====#
[[ -d ${GRUB_DIR}/${NAME} ]] && rm -rf ${GRUB_DIR}/${NAME}

mkdir -p "${GRUB_DIR}/${NAME}" 

cp -a "${THEME_DIR}/." "${GRUB_DIR}/${NAME}/"

#=====>   set theme   <=====#
cp -an /etc/default/grub /etc/default/grub.bak

grep "GRUB_THEME=" /etc/default/grub >/dev/null 2>&1 && sed -i '/GRUB_THEME=/d' /etc/default/grub

echo "GRUB_THEME=\"${GRUB_DIR}/${NAME}/theme.txt\"" >> /etc/default/grub

grub-mkconfig -o /boot/grub/grub.cfg >/dev/null 2>&1

echo "grub config setup."
