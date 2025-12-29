#!/usr/bin/env bash

cwd="$PWD"

kitty @ set-tab-title run
kitty @ launch --type=tab --title git --cwd="$cwd" --hold sh -c 'lazygit; exec $SHELL'
kitty @ launch --type=tab --title nvim --cwd="$cwd" --hold nvim

clear
