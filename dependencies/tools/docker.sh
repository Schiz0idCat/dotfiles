#!/bin/bash

if ! command -v docker >/dev/null 2>&1; then
    echo "Installing Docker..."

    if ! sudo pacman -S --noconfirm docker; then
        echo "Error: failed to install Docker. Aborting."
        exit 1
    fi
fi

if ! systemctl is-enabled --quiet docker; then
    echo "Enabling and starting Docker service..."
    if ! sudo systemctl enable --now docker; then
        echo "Error: failed to enable/start Docker service. Aborting."
        exit 1
    fi
    echo "Docker service enabled and started."
else
    echo "Docker service is already enabled."
    echo "Ensuring Docker service is running..."
    if ! systemctl is-active --quiet docker; then
        if ! sudo systemctl start docker; then
            echo "Error: failed to start Docker service. Aborting."
            exit 1
        fi
    fi
    echo "Docker service is already running."
fi

if ! groups "$USER" | grep -qw docker; then
    echo "Adding user '$USER' to docker group..."
    if ! sudo usermod -aG docker "$USER"; then
        echo "Error: failed to add user to docker group. Aborting."
        exit 1
    fi
    echo "User '$USER' added to docker group. Please log out and back in to apply the change."
fi

if ! command -v docker-compose >/dev/null 2>&1 && ! docker compose version >/dev/null 2>&1; then
    echo "Installing docker-compose-plugin..."

    if ! sudo pacman -S --noconfirm docker-compose-plugin; then
        echo "Error: failed to install docker-compose-plugin. Trying classic docker-compose..."

        if ! sudo pacman -S --noconfirm docker-compose; then
            echo "Error: failed to install docker-compose as fallback. Aborting."
            exit 1
        fi
    fi
fi

echo "Docker installation and setup complete."
