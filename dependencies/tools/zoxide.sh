#!/bin/bash

if ! command -v zoxide >/dev/null 2>&1; then
    echo "Installing zoxide..."

    if ! command -v curl >/dev/null 2>&1; then
        chmod +x ~/dotfiles/dependencies/tools/curl.sh
        bash ~/dotfiles/dependencies/tools/curl.sh
    fi

    curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash || {
        echo "Error: failed to install zoxide. Aborting."
        exit 1
    }
fi
echo "zoxide installed"
