#!/bin/bash

export CARGO_HOME="$HOME/.cargo"
export PATH="$CARGO_HOME/bin:$PATH"

set -e

if ! command -v yazi >/dev/null 2>&1; then
    echo "Installing yazi..."

    echo "Installing dependencies..."

    sudo apt install ffmpeg 7zip jq poppler-utils fd-find ripgrep fzf zoxide imagemagick

    git clone https://github.com/sxyazi/yazi.git && cd yazi

    if ! command -v cargo >/dev/null 2>&1; then
        chmod +x ~/dotfiles/dependencies/lenguages/rust.sh 
        bash ~/dotfiles/dependencies/lenguages/rust.sh
    fi 

    cargo build --release --locked
    sudo mv target/release/yazi target/release/ya /usr/local/bin/

    cd .. && rm -rf yazi
fi
echo "Yazi installed."
