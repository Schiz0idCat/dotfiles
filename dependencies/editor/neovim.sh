#!/bin/bash

if ! command -v nvim >/dev/null 2>&1; then
    echo "Installing Neovim..."

    TEMP_DIR=$(mktemp -d)
    if ! pushd "$TEMP_DIR" >/dev/null; then
        echo "Error: failed to access temporary directory. Aborting."
        exit 1
    fi

    if ! command -v curl >/dev/null 2>&1; then
        chmod +x ../tools/curl.sh
        bash ../tools/curl.sh        
    fi

    if ! curl -LO https://github.com/neovim/neovim/releases/download/v0.11.0/nvim-linux-x86_64.tar.gz; then
        echo "Error: failed to download Neovim. Aborting."
        popd >/dev/null
        exit 1
    fi

    tar xzvf nvim-linux-x86_64.tar.gz
    sudo mv nvim-linux-x86_64 /opt/nvim

    popd >/dev/null
    rm -rf "$TEMP_DIR"
fi
echo "Neovim installed."
