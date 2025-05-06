#!/bin/bash

if ! command -v oh-my-posh >/dev/null 2>&1; then
     echo "Installing Oh My Posh..."
     if ! curl -s https://ohmyposh.dev/install.sh | bash -s; then
         echo "Error: failed to install Oh My Posh. Aborting."
         exit 1
     fi
fi
echo "Oh My Posh installed."
