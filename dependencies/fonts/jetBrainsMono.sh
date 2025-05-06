#!/bin/bash

FONT="JetBrainsMono"
DEST="$HOME/.local/share/fonts"

if ! fc-list | grep -qi "$FONT"; then
    echo "Installing $FONT..."

    mkdir -p "$DEST" || {
        echo "Error: failed to create destination directory: $DEST"
        exit 1
    }

    pushd "$DEST" > /dev/null || {
        echo "Error: failed to access destination directory."
        exit 1
    }

    if ! command -v curl >/dev/null 2>&1; then
        chmod +x ../tools/curl.sh
        bash ../tools/curl.sh        
    fi

    echo "Downloading $FONT Nerd Font..."
    if ! curl -fLo "${FONT}.zip" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/${FONT}.zip"; then
        echo "Error: failed to download the font. Aborting installation."
        popd > /dev/null
        exit 1
    fi

    unzip -o "${FONT}.zip"
    rm "${FONT}.zip"

    echo "Refreshing font cache..."
    fc-cache -fv

    popd > /dev/null
fi
echo "$FONT installed."
