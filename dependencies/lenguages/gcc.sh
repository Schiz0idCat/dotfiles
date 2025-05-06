#!/bin/bash

set -e

if ! command -v gcc >/dev/null 2>&1; then
    echo "Installing gcc (C compiler)..."

    sudo apt install -y build-essential
fi
echo "gcc installed."
