#!/bin/bash

editorLn=(
   "/opt/nvim/bin/nvim:/usr/local/bin/nvim:SUDO"
   "~/dotfiles/nvim/chadrc.lua:~/.config/nvim/lua/chadrc.lua"
   "~/dotfiles/nvim/options.lua:~/.config/nvim/lua/options.lua"
   "~/dotfiles/nvim/configs/lspconfig.lua:~/.config/nvim/lua/configs/lspconfig.lua"
   "~/dotfiles/nvim/configs/spell.lua:~/.config/nvim/lua/configs/spell.lua"
   "~/dotfiles/nvim/plugins/cmp.lua:~/.config/nvim/lua/plugins/cmp.lua"
   "~/dotfiles/nvim/plugins/nvimtree.lua:~/.config/nvim/lua/plugins/nvimtree.lua"
   "~/dotfiles/nvim/plugins/noice.lua:~/.config/nvim/lua/plugins/noice.lua"
   "~/dotfiles/nvim/plugins/notify.lua:~/.config/nvim/lua/plugins/notify.lua"
   "~/dotfiles/nvim/plugins/indent.lua:~/.config/nvim/lua/plugins/indent.lua"
)

terminalLn=(
    "~/.local/kitty.app/bin/kitty:/usr/local/bin/kitty:SUDO"
    "~/.local/kitty.app/bin/kitten:/usr/local/bin/kitten:SUDO"
    "~/dotfiles/terminal/kitty/kitty.conf:~/.config/kitty/kitty.conf"
    "~/dotfiles/terminal/kitty/theme.conf:~/.config/kitty/theme.conf"
)

shellLn=(
    "~/dotfiles/terminal/zsh/.zshrc:~/.zshrc"
    "~/dotfiles/terminal/zsh/aliases.zsh:~/.oh-my-zsh/custom/aliases.zsh"
)
