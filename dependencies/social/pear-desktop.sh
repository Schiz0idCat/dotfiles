#!/bin/bash

if ! command -v pear-desktop >/dev/null 2>&1; then
    echo "Installing pear-desktop..."

    if ! yay -S --noconfirm --needed --answerclean None --answerdiff None pear-desktop; then
        echo "Error: failed to install pear-desktop. Aborting."
        exit 1
    fi
fi

echo "pear-desktop installed."
