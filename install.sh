#!/bin/bash

set -e
set -u

installDependencies() {
    local scripts=("$@")

    for script in "${scripts[@]}"; do
        chmod +x "$script"
        bash "$script"
    done
}

installExtraDependencies() {
    local scripts=("$@")

    for script in "${scripts[@]}"; do
        chmod +x "$script"
        bash "$script" | sed 's/^/\t/'
    done
}

makeLink() {
    local links=("$@")
    for entry in "${links[@]}"; do
        IFS=':' read -r source target maybeSudo <<< "$entry"
        source="${source/#\~/$HOME}"
        target="${target/#\~/$HOME}"

        mkdir -p "$(dirname "$target")"
        if [[ "${maybeSudo:-}" == "SUDO" ]]; then
            sudo ln -sf "$source" "$target"
        else
            ln -sf "$source" "$target"
        fi
    done
}

sudo apt update
source "./dependencies/dependencies.sh"
source "./dependencies/links.sh"

echo -e "\nStarting dotfiles installation..."

echo ""

echo "#==========>   LENGUAGES   <==========#"
installDependencies "${lenguages[@]}"

echo ""

echo "#==========>   EDITOR   <==========#"
installDependencies "${editor[@]}"

echo -e "\n\t#=====> EXTRAS <=====#"
installExtraDependencies "${editorExtras[@]}"

makeLink "${editorLn[@]}"
echo -e "\nEditor config setup."

echo ""

echo "#==========>   TOOLS   <==========#"
installDependencies "${tools[@]}"

echo ""

echo "#==========>   FONTS   <==========#"
installDependencies "${fonts[@]}"

echo ""

echo "#==========>   SHELL   <==========#"
installDependencies "${shell[@]}"

echo -e "\n\t#=====> EXTRAS <=====#"
installExtraDependencies "${shellExtras[@]}"

makeLink "${shellLn[@]}"
echo -e "\nShell config setup."

echo "#==========>   TERMINAL   <==========#"
installDependencies "${terminal[@]}"

makeLink "${terminalLn[@]}"
echo -e "\nTerminal config setup."

echo ""

echo "Dotfiles have been installed successfully :)"
