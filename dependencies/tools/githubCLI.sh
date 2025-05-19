#!/bin/bash

if ! command -v gh >/dev/null 2>&1; then
    echo "Installing githubCLI"

    if ! command -v curl >/dev/null 2>&1; then
        chmod +x ~/dotfiles/dependencies/tools/curl.sh 
        bash ~/dotfiles/dependencies/tools/curl.sh
    fi

    if ! command -v wget >/dev/null 2>&1; then
        chmod +x ~/dotfiles/dependencies/tools/wget.sh 
        bash ~/dotfiles/dependencies/tools/wget.sh
    fi

    sudo mkdir -p -m 755 /etc/apt/keyrings || {
        echo "Error: failed to create /etc/apt/keyrings. Aborting."
        exit 1
    }

    temp_keyring=$(mktemp)
    wget -nv -O "$temp_keyring" https://cli.github.com/packages/githubcli-archive-keyring.gpg || {
        echo "Error: failed to download GitHub CLI keyring. Aborting."
        exit 1
    }

    cat "$temp_keyring" | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null || {
        echo "Error: failed to install keyring. Aborting."
        exit 1
    }

    sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg || {
        echo "Error: failed to set keyring permissions. Aborting."
        exit 1
    }

    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | \
        sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

    sudo apt update || {
        echo "Error: failed to update apt. Aborting."
        exit 1
    }

    sudo apt install -y gh || {
        echo "Error: failed to install GitHub CLI. Aborting."
        exit 1
    }

fi
echo "githubCLI installed"
