#!/bin/bash

set -e
set -u

installDependencies() {
    local entries=("$@")

    for entry in "${entries[@]}"; do
        IFS=':' read -r script flag1 flag2 <<< "$entry"
        chmod +x "$script"

        local use_sudo=false
        local use_indent=false

        [[ "$flag1" == "SUDO" || "$flag2" == "SUDO" ]] && use_sudo=true
        [[ "$flag1" == "EXTRA" || "$flag2" == "EXTRA" ]] && use_indent=true

        if $use_sudo; then
            if $use_indent; then
                sudo bash "$script" | sed 's/^/\t/'
            else
                sudo bash "$script"
            fi
        else
            if $use_indent; then
                bash "$script" | sed 's/^/\t/'
            else
                bash "$script"
            fi
        fi
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

sudo pacman -Syu
source "./dependencies/dependencies.sh"
source "./dependencies/links.sh"

echo -e "\nStarting dotfiles installation..."

echo ""

echo "#==========>   LENGUAGES   <==========#"
installDependencies "${lenguages[@]}"

echo -e "\nLenguages installed."

echo ""

echo "#==========>   EDITOR   <==========#"
installDependencies "${editor[@]}"

makeLink "${editorLn[@]}"
echo -e "\nEditor config setup."

echo ""

echo "#==========>   TOOLS   <==========#"
installDependencies "${tools[@]}"

makeLink "${toolsLn[@]}"
echo -e "\nTools config setup."

echo ""

echo "#==========>   BROWSER   <==========#"
installDependencies "${browser[@]}"

echo -e "\nBrowsers installed setup."

echo ""

echo "#==========>   FONTS   <==========#"
installDependencies "${fonts[@]}"

makeLink "${fontLn[@]}"
echo -e "\nFont link setup."

echo ""

echo "#==========>   SHELL   <==========#"
installDependencies "${shell[@]}"

echo -e "\n\t#=====> EXTRAS <=====#"
installDependencies "${shellExtras[@]}"

makeLink "${shellLn[@]}"
echo -e "\nShell config setup."

echo ""

echo "#==========>   TERMINAL   <==========#"
installDependencies "${terminal[@]}"

makeLink "${terminalLn[@]}"
echo -e "\nTerminal config setup."

echo ""

echo "#==========>   WM   <==========#"
installDependencies "${wm[@]}"

makeLink "${wmLn[@]}"
echo -e "\nWM config setup."

echo ""

echo "#==========>   OTHER   <==========#"
installDependencies "${other[@]}"
echo -e "\nOther configs setup."

echo ""

echo "#==========>   SOCIAL   <==========#"
installDependencies "${social[@]}"

echo -e "\nSocial configs setup."

echo ""

echo "#==========>   SCRIPTS   <==========#"
makeLink "${scriptsLn[@]}"

echo -e "Scripts installed"

echo ""

echo "Dotfiles have been installed successfully :)"
