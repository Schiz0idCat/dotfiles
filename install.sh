#!/bin/bash

if ! sudo apt update; then
  echo "Incorrect password"
  exit 1
fi

echo ""

##### MEDIA #####
# Font
FONT="JetBrainsMono"
DEST="$HOME/.local/share/fonts"

if ! fc-list | grep -qi "$FONT"; then
    echo "Installing $FONT..."

    mkdir -p "$DEST" || {
        echo "Error: failed to create destination directory: $DEST"
        exit 1
    }

    pushd "$DEST" > /dev/null || {
        echo "Error: failed to access destination directory."
        exit 1
    }

    echo "Downloading $FONT Nerd Font..."
    if ! curl -fLo "${FONT}.zip" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/${FONT}.zip"; then
        echo "Error: failed to download the font. Aborting installation."
        popd > /dev/null
        exit 1
    fi

    unzip -o "${FONT}.zip"
    rm "${FONT}.zip"

    echo "Refreshing font cache..."
    fc-cache -fv

    popd > /dev/null
fi
echo "Font $FONT installed."

echo ""

##### TERMINAL #####
# Install zsh
if ! command -v zsh &> /dev/null; then
    echo "Installing zsh..."
    sudo apt install -y zsh || {
        echo "Error: zsh installation failed. Aborting."
        exit 1
    }
fi
echo "zsh installed."

# Set zsh as default shell
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "Setting zsh as default shell..."
    if ! chsh -s "$(which zsh)"; then
        echo "Error: failed to change default shell."
        exit 1
    fi
fi
echo "Default shell is zsh." 

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    if ! sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"; then
        echo "Error: failed to install Oh My Zsh. Aborting."
        exit 1
    fi
fi
echo "Oh My Zsh installed."

# Install Powerlevel10k
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    echo "Installing Powerlevel10k..."
    if ! git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
        "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"; then
        echo "Error: failed to clone Powerlevel10k. Aborting."
        exit 1
    fi
fi
echo "Powerlevel10k installed."

echo ""

# plugins
# Install syntax highlighting
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    echo "Installing zsh-syntax-highlighting..."
    if ! git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
        "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"; then
        echo "Error: failed to clone zsh-syntax-highlighting. Aborting."
        exit 1
    fi
fi
echo "zsh-syntax-highlighting installed."

# Install zsh-autosuggestions
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    echo "Installing zsh-autosuggestions..."
    if ! git clone https://github.com/zsh-users/zsh-autosuggestions \
        "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"; then
        echo "Error: failed to clone zsh-autosuggestions. Aborting."
        exit 1
    fi
fi
echo "zsh-autosuggestions installed."

echo ""

# Extra commands
# Install bat
if ! command -v batcat >/dev/null 2>&1 && ! command -v bat >/dev/null 2>&1; then
    echo "Installing bat..."
    if ! sudo apt install -y bat; then
        echo "Error: failed to install bat. Aborting."
        exit 1
    fi
fi
echo "bat installed."

# Install lsd
if ! command -v lsd >/dev/null 2>&1; then
    echo "Installing lsd..."
    if ! sudo apt install -y lsd; then
        echo "Error: failed to install lsd. Aborting."
        exit 1
    fi
fi
echo "lsd installed."

echo ""

##### EDITOR #####
# Install Neovim
if ! command -v nvim >/dev/null 2>&1; then
    echo "Installing Neovim..."

    TEMP_DIR=$(mktemp -d)
    if ! pushd "$TEMP_DIR" >/dev/null; then
        echo "Error: failed to access temporary directory. Aborting."
        exit 1
    fi

    echo "Downloading Neovim 0.11..."
    if ! curl -LO https://github.com/neovim/neovim/releases/download/v0.11.0/nvim-linux-x86_64.tar.gz; then
        echo "Error: failed to download Neovim. Aborting."
        popd >/dev/null
        exit 1
    fi

    echo "Extracting Neovim..."
    tar xzvf nvim-linux-x86_64.tar.gz

    echo "Installing Neovim to /opt/nvim..."
    sudo mv nvim-linux-x86_64 /opt/nvim
    sudo ln -sf /opt/nvim/bin/nvim /usr/local/bin/nvim

    popd >/dev/null
    rm -rf "$TEMP_DIR"
fi
echo "Neovim installed."

# Install nvchad

# nvchad extras
# Install Node.js and npm
if ! command -v nodejs >/dev/null 2>&1 || ! command -v npm >/dev/null 2>&1; then
    echo "Installing Node.js and npm..."
    if ! sudo apt install -y nodejs npm; then
        echo "Error: failed to install Node.js or npm. Aborting."
        exit 1
    fi
fi
echo "Node.js and npm installed."

# Install bash-language-server
if ! command -v bash-language-server >/dev/null 2>&1; then
    echo "Installing bash-language-server..."
    if ! npm install -g bash-language-server; then
        echo "Error: failed to install bash-language-server. Aborting."
        exit 1
    fi
fi
echo "bash-language-server installed."

if [ ! -d "$HOME/.config/nvim/spell/" ]; then
    mkdir ~/.config/nvim/spell/
fi
echo "Spell directory created."

echo ""

##### LINKS #####
# .zshrc
ln -sf ~/dotfiles/terminal/zsh/.zshrc ~/
ln -sf ~/dotfiles/terminal/zsh/aliases.zsh ~/.oh-my-zsh/custom/
echo "zsh link created"

# powerlevel10k
ln -sf ~/dotfiles/terminal/powerlevel10k/.p10k.zsh ~/
echo "powerlevel10k link created"

# nvchad
ln -sf ~/dotfiles/nvim/spell/es.utf-8.spl ~/.config/nvim/spell/
ln -sf ~/dotfiles/nvim/spell/es.utf-8.sug ~/.config/nvim/spell/
ln -sf ~/dotfiles/nvim/chadrc.lua ~/.config/nvim/lua/
ln -sf ~/dotfiles/nvim/options.lua ~/.config/nvim/lua/
ln -sf ~/dotfiles/nvim/configs/lspconfig.lua ~/.config/nvim/lua/configs/
ln -sf ~/dotfiles/nvim/configs/spell.lua ~/.config/nvim/lua/configs/
ln -sf ~/dotfiles/nvim/plugins/cmp.lua ~/.config/nvim/lua/plugins/
ln -sf ~/dotfiles/nvim/plugins/nvimtree.lua ~/.config/nvim/lua/plugins/
ln -sf ~/dotfiles/nvim/plugins/noice.lua ~/.config/nvim/lua/plugins/
ln -sf ~/dotfiles/nvim/plugins/notify.lua ~/.config/nvim/lua/plugins/
echo "nvchad link created"

echo ""

##### FIN #####
echo "dotfiles setup done :)"
