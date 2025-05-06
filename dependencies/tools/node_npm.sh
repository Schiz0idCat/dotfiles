#!/bin/bash

if ! command -v node >/dev/null 2>&1 || ! command -v npm >/dev/null 2>&1 || [ "$(node -v | cut -d. -f1 | tr -d v)" -lt 20 ]; then
    echo "Installing node and npm..."

    if ! command -v curl >/dev/null 2>&1; then
        chmod +x ../tools/curl.sh
        bash ../tools/curl.sh        
    fi

    curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - && \
    sudo apt install -y nodejs || {
        echo "Error: failed to install Node.js or npm. Aborting."
        exit 1
    }
fi
echo "Node.js installed."
echo "npm installed."
