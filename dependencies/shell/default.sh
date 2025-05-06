#!/bin/bash

if [ "$SHELL" != "$(which zsh)" ]; then
    echo "Setting zsh as default shell..."

    if ! command -v zsh >/dev/null 2>&1; then
        chmod +x ~/dotfiles/dependencies/shell/zsh.sh
        bash ~/dotfiles/dependencies/shell/zsh.sh
    fi

    if ! chsh -s "$(which zsh)"; then
        echo "Error: failed to change default shell."
        exit 1
    fi
fi
echo "Default shell is zsh." 
