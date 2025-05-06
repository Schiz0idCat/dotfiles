#!/bin/bash

if ! command -v kitty >/dev/null 2>&1; then
    echo "Installing Kitty..."

    if ! command -v curl >/dev/null 2>&1; then
        chmod +x ../tools/curl.sh
        bash ../tools/curl.sh        
    fi

    if ! curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin; then
        echo "Error: failed to install Kitty. Aborting."
        exit 1
    fi
fi
echo "Kitty installed."
