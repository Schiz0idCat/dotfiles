#!/bin/bash

if ! command -v silicon >/dev/null 2>&1; then
    echo "Installig silicon..."

    echo "Installing dependencies..."

    sudo apt install -y \
        expat \
        libxml2-dev \
        pkg-config \
        libasound2-dev \
        libssl-dev \
        cmake \
        libfreetype6-dev \
        libexpat1-dev \
        libxcb-composite0-dev \
        libharfbuzz-dev \
        libfontconfig1-dev \
        g++ > /dev/null 2>&1

    echo "Dependencies installed."

    if ! command -v cargo >/dev/null 2>&1; then
        chmod +x ~/dotfiles/dependencies/lenguages/rust.sh 
        bash ~/dotfiles/dependencies/lenguages/rust.sh
    fi 

    if ! cargo install silicon; then
        echo "Error: failed to install silicon. Aborting."
        exit 1
    fi
fi
echo "silicon installed."
