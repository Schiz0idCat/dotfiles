#!/bin/bash

editorLn=(
   "/opt/nvim/bin/nvim:/usr/local/bin/nvim:SUDO"
   "~/dotfiles/nvim:~/.config/"
)

terminalLn=(
    "~/.local/kitty.app/bin/kitty:/usr/local/bin/kitty:SUDO"
    "~/.local/kitty.app/bin/kitten:/usr/local/bin/kitten:SUDO"
    "~/dotfiles/terminal/kitty/kitty.conf:~/.config/kitty/kitty.conf"
    "~/dotfiles/terminal/kitty/theme.conf:~/.config/kitty/theme.conf"
)

shellLn=(
    "~/dotfiles/terminal/zsh/.zshenv:~/"
    "~/dotfiles/terminal/zsh/.zshrc:~/.config/zsh/"
    "~/dotfiles/terminal/zsh/aliases.zsh:~/.config/oh-my-zsh/custom/aliases.zsh"
)

wmLn=(
    "~/dotfiles/hypr/:~/.config/"
    "~/dotfiles/waybar/:~/.config/"
    "~/dotfiles/wofi/:~/.config/"
)

toolsLn=(
    "~/dotfiles/superfile/:~/.config/"
    "~/dotfiles/mpv/:~/.config/"
)

fontLn=(
    "~/dotfiles/fontconfig/:~/.config/"
)
