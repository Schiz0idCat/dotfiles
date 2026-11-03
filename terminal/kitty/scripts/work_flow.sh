#!/usr/bin/env bash

cwd="$PWD"

kitty @ set-tab-title run
kitty @ launch --type=tab --title git --cwd="$cwd" --hold lazygit
kitty @ launch --type=tab --title nvim --cwd="$cwd" --hold nvim
kitty @ launch --type=tab --title opencode --cwd="$cwd" --hold opencode

clear
