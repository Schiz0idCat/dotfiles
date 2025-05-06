#!/bin/bash

if ! command -v batcat >/dev/null 2>&1 && ! command -v bat >/dev/null 2>&1; then
    echo "Installing bat..."
    if ! sudo apt install -y bat; then
        echo "Error: failed to install bat. Aborting."
        exit 1
    fi
fi
echo "bat installed."
