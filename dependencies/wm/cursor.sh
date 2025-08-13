#!/bin/bash

if ! pacman -Q capitaine-cursors &>/dev/null; then
    echo "Installing Capitaine Cursors..."

    if ! sudo pacman -S --noconfirm capitaine-cursors; then
        echo "Error: failed to install Capitaine Cursors. Aborting."
        exit 1
    fi

    sudo rm -rf /usr/share/icons/capitaine-cursors-light/
fi

echo "Capitaine Cursors installed."

# set cursor
ensure_line() {
    local line=$1
    local file=$2
    sudo grep -Fxq "$line" "$file" 2>/dev/null || echo "$line" | sudo tee -a "$file" > /dev/null
}

ICON_THEME_FILE="/usr/share/icons/default/index.theme"
if [ ! -f "$ICON_THEME_FILE" ]; then
    sudo tee "$ICON_THEME_FILE" > /dev/null << EOF
[Icon Theme]
Name=Default
Comment=Default cursor theme
Inherits=capitaine-cursors
EOF
else
    ensure_line "[Icon Theme]" "$ICON_THEME_FILE"
    ensure_line "Name=Default" "$ICON_THEME_FILE"
    ensure_line "Comment=Default cursor theme" "$ICON_THEME_FILE"
    ensure_line "Inherits=capitaine-cursors" "$ICON_THEME_FILE"
fi

ENV_FILE="/etc/environment"
ensure_line "XCURSOR_THEME=capitaine-cursors" "$ENV_FILE"
ensure_line "XCURSOR_SIZE=32" "$ENV_FILE"
