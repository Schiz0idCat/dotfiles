#!/bin/bash

sudo apt update

##### TERMINAL #####
# instalar zsh
if ! command -v zsh &> /dev/null; then
    echo "Instalando zsh..."
    sudo apt install -y zsh || {
        echo "Falló la instalación de zsh. Abortando."
        exit 1
    }
fi
echo -e "zsh instalado en el sistema\n"

# font
FONT="JetBrainsMono"
DEST="$HOME/.local/share/fonts"

if fc-list | grep -qi "$FONT"; then
    echo -e "Fuente $FONT instalada en el sistema.\n"
else
    mkdir -p "$DEST"

    pushd "$DEST" > /dev/null || {
        echo "Error: no se pudo acceder al directorio de destino."
        exit 1
    }

    echo "Descargando $FONT Nerd Font..."
    curl -fLo "${FONT}.zip" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/${FONT}.zip"

    if [ $? -ne 0 ]; then
        echo "Error al descargar la fuente. Abortando instalación."
        popd > /dev/null
        exit 1
    else
        unzip -o "${FONT}.zip"
        rm "${FONT}.zip"

        echo "Recargando caché de fuentes..."
        fc-cache -fv

        echo -e "Fuente $FONT instalada en el sistema.\n"
    fi

    popd > /dev/null
fi

# instalar oh my zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Instalando Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    if [ $? -ne 0 ]; then
        echo "Error al instalar Oh My Zsh. Abortando."
        exit 1
    fi
fi
echo -e "Oh My Zsh instalado en el sistema\n"

# plugins
# syntax highlighting
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    echo "Instalando zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
        "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"

    if [ $? -ne 0 ]; then
        echo "Error al clonar zsh-syntax-highlighting. Abortando."
        exit 1
    fi
fi
echo "zsh-syntax-highlighting ya está instalado."

# autosuggestions
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    echo "Instalando zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions \
        "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

    if [ $? -ne 0 ]; then
        echo "Error al clonar zsh-autosuggestions. Abortando."
        exit 1
    fi
fi
echo "zsh-autosuggestions ya está instalado."

echo ""

# instalar powerlevel10k
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    echo "Instalando Powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
        "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

    if [ $? -ne 0 ]; then
        echo "Error al clonar Powerlevel10k. Abortando."
        exit 1
    fi
fi
echo -e "Powerlevel10k instalado en el sistema.\n"

echo ""

# comandos extra
# instalar bat
if ! command -v bat >/dev/null 2>&1 && ! command -v batcat >/dev/null 2>&1; then
    echo "Instalando bat..."
    sudo apt install -y bat

    if [ $? -ne 0 ]; then
        echo "Error al instalar bat. Abortando."
        exit 1
    fi
fi
echo "bat instalado en el sistema"

# instalar lsd
if ! command -v lsd >/dev/null 2>&1; then
    echo "Instalando lsd..."
    sudo apt install -y lsd

    if [ $? -ne 0 ]; then
        echo "Error al instalar lsd. Abortando."
        exit 1
    fi
fi
echo "lsd instalado en el sistema"

# instalar Neovim
if ! command -v nvim &> /dev/null; then
    echo "Instalando Neovim..."

    TEMP_DIR=$(mktemp -d)
    pushd "$TEMP_DIR" > /dev/null || {
        echo "Error al acceder al directorio temporal."
        exit 1
    }

    echo "Descargando Neovim..."
    curl -LO https://github.com/neovim/neovim/releases/download/v0.11.0/nvim-linux-x86_64.tar.gz

    if [ $? -ne 0 ]; then
        echo "Error al descargar Neovim. Abortando."
        popd > /dev/null
        exit 1
    fi

    tar xzvf nvim-linux-x86_64.tar.gz

    sudo mv nvim-linux-x86_64 /opt/nvim
    sudo ln -sf /opt/nvim/bin/nvim /usr/local/bin/nvim

    popd > /dev/null
    rm -rf "$TEMP_DIR"
fi
echo "Neovim ya está instalado en el sistema."

# Desde este punto se asume que nvchad está instalado

echo ""

##### LINKS #####
# .zshrc
ln -sf ~/dotfiles/terminal/zsh/.zshrc ~/.zshrc
ln -sf ~/dotfiles/terminal/zsh/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh
echo "Enlaces simbólicos de zsh creados"

# powerlevel10k
ln -sf ~/dotfiles/terminal/powerlevel10k/.p10k.zsh ~/.p10k.zsh
echo "Enlace simbólico de powerlevel10k creado"

# nvchad ##### ASUMIENDO QUE NVCHAD ESTÁ INSTALADO #####
ln -sf ~/dotfiles/nvim/chadrc.lua ~/.config/nvim/lua/chadrc.lua
ln -sf ~/dotfiles/nvim/options.lua ~/.config/nvim/lua/options.lua
ln -sf ~/dotfiles/nvim/configs/lspconfig.lua ~/.config/nvim/lua/configs/lspconfig.lua
ln -sf ~/dotfiles/nvim/plugins/cmp.lua ~/.config/nvim/lua/plugins/cmp.lua
ln -sf ~/dotfiles/nvim/plugins/nvimtree.lua ~/.config/nvim/lua/plugins/nvimtree.lua
echo "Enlace simbólico de nvchad creado"

echo ""

##### FIN #####
echo "Configuración de dotfiles completada"
