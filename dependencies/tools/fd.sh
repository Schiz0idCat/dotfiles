#!/bin/bash

if ! command -v fd >/dev/null 2>&1 && ! command -v fdfind >/dev/null 2>&1; then
    echo "Installing fd-find..."

    if ! sudo apt install -y fd-find; then
        echo "Error: failed to install fd-find. Aborting."
        exit 1
    fi

    mkdir -p ~/.local/bin

    if ! echo "$PATH" | grep -q "$HOME/.local/bin"; then
        echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
        echo "Added ~/.local/bin to PATH in ~/.bashrc. You may need to restart your shell or run 'source ~/.bashrc'."
    fi

    ln -s "$(which fdfind)" "$HOME/.local/bin/fd"
fi
echo "fd is installed."
