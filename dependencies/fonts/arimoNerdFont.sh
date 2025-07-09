if ! fc-list | grep -iq "Arimo Nerd"; then
    echo "Installing Arimo Nerd Font..."

    if ! command -v yay >/dev/null 2>&1; then
        echo "ERROR: yay not installed."
        exit 1
    fi

    if ! yay -S --noconfirm ttf-arimo-nerd; then
        echo "ERROR: nerd-fonts-arimo installation failed."
        exit 1
    fi
fi
echo "Arimo Nerd Font installed." 
