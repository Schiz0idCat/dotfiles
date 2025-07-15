#!/bin/bash

if ! command -v cargo >/dev/null 2>&1; then
    echo "Installing Rust (cargo)..."

    if ! curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y; then
        echo "Error: failed to install Rust. Aborting."
        exit 1
    fi

    if ! . "$HOME/.cargo/env"; then
        echo "Error: failed to source cargo environment. Aborting."
        exit 1
    fi
fi

echo "Cargo installed."

if ! cargo install-update -V >/dev/null 2>&1; then
    echo "Installing cargo-update..."

    if ! cargo install cargo-update; then
        echo "Error: failed to install cargo-update. Aborting."
        exit 1
    fi
fi

echo "cargo-update installed."
