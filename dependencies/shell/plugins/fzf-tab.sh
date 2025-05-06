#!/bin/bash

if [ ! -d "$PLUGIN_DIR" ]; then
    echo "Cloning fzf-tab plugin..."

    if ! git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab; then
        echo "Error: failed to clone fzf-tab. Aborting."
        exit 1
    fi
fi
echo "fzf-tab installed."
