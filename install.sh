#!/bin/bash

##### ZSH #####
# instalar zsh
if ! command -v zsh &> /dev/null; then
    echo "Instalando zsh..."
    sudo apt install -y zsh || {
        echo "Falló la instalación de zsh. Abortando."
        exit 1
    }
fi
echo -e "zsh instalado en el sistema\n"

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

# link
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
echo "Enlace simbólico de .zshrc creado"
ln -sf ~/dotfiles/zsh/.p10k.zsh ~/.p10k.zsh
echo -e "Enlace simbólico de .p10k.zsh creado\n"

##### FONT #####
FONT="JetBrainsMono"
DEST="$HOME/.local/share/fonts"

if fc-list | grep -qi "$FONT"; then
    echo "Fuente $FONT instalada en el sistema."
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

        echo "Fuente $FONT instalada en el sistema."
    fi

    popd > /dev/null
fi

##### FIN #####
echo -e "\nConfiguración de dotfiles completada"
