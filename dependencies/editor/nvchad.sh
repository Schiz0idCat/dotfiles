#!/bin/bash

if [ ! -d "$HOME/.config/nvim" ]; then
    echo "Cloning NvChad..."
    if ! git clone https://github.com/NvChad/starter ~/.config/nvim; then
        echo "Error: failed to clone NvChad. Aborting."
        exit 1
    fi

    nvim +qa
    nvim --headless +"Lazy! sync" +"autocmd User LazyDone ++once lua require('mason-tool-installer').run()" +qa
    rm -rf ~/.config/nvim/.git
fi
echo "NvChad installed."
