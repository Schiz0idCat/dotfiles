#!/bin/bash

if ! command -v lsd >/dev/null 2>&1; then
    echo "Installing lsd..."
    if ! sudo apt install -y lsd; then
        echo "Error: failed to install lsd. Aborting."
        exit 1
    fi
fi
echo "lsd installed."
