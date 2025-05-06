#!/bin/bash

set -e

if ! command -v clangd >/dev/null 2>&1; then
    echo "Installing clangd (C/C++ language server)..."
    
    sudo apt install -y clangd
fi
echo "clangd installed."
