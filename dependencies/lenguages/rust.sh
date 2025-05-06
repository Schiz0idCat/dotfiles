#!/bin/bash

if ! command -v cargo >/dev/null 2>&1; then
    echo "Installing Rust..."

    if ! command -v curl >/dev/null 2>&1; then
        chmod +x ../tools/curl.sh
        bash ../tools/curl.sh        
    fi

    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
fi
echo "Rust installed."
