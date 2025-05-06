#!/bin/bash

if ! command -v bash-language-server >/dev/null 2>&1; then
    echo "Installing bash-language-server..."

    if ! command -v npm >/dev/null 2>&1; then
        chmod +x ~/dotfiles/dependencies/tools/node_npm.sh
        bash ~/dotfiles/dependencies/tools/node_npm.sh
    fi

    if ! sudo npm install -g bash-language-server; then
        echo "Error: failed to install bash-language-server. Aborting."
        exit 1
    fi
fi
echo "bash-language-server installed."
