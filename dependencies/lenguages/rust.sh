#!/bin/bash

: "${XDG_DATA_HOME:=$HOME/.local/share}"

export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export PATH="$CARGO_HOME/bin:$PATH"

if ! command -v cargo >/dev/null 2>&1; then
    echo "Installing Rust (cargo)..."

    if ! curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y; then
        echo "Error: failed to install Rust. Aborting."
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

if [ -f "$HOME/.profile" ]; then
  rm "$HOME/.profile"
fi
