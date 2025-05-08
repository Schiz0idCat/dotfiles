#!/bin/bash

if ! command -v lazygit >/dev/null 2>&1; then
    echo "Installing lazygit..."

    if ! sudo apt install -y lazygit; then
        echo "Error: failed to install lazygit. Aborting."
        exit 1
    fi
fi
echo "lazygit installed."
