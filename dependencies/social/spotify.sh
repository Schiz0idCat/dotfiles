#!/bin/bash

if ! command -v spotify_player >/dev/null 2>&1; then
    echo "Installing Spotify player..."

    if ! sudo pacman -S --noconfirm spotify-player; then
        echo "Error: failed to install Spotify player. Aborting."
        exit 1
    fi
fi

echo "Spotify player installed."
