#!/bin/bash

if ! command -v spotify_player >/dev/null 2>&1; then
    echo "Installing spotify-player-full..."

    if ! command -v yay >/dev/null 2>&1; then
        echo "Error: yay is not installed. Please install yay first."
        exit 1
    fi

    if ! yay -S --noconfirm spotify-player-full; then
        echo "Error: failed to install spotify-player-full. Aborting."
        exit 1
    fi
fi

echo "spotify-player-full installed."
