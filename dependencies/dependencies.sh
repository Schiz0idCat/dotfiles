#!/bin/bash

lenguagesDir="dependencies/lenguages"
editorDir="dependencies/editor"
toolsDir="dependencies/tools"
fontsDir="dependencies/fonts"
terminalDir="dependencies/terminal"
shellDir="dependencies/shell"
shellPluginsDir="$shellDir/plugins"

lenguages=(
    "$lenguagesDir/gcc.sh"
    "$lenguagesDir/rust.sh"
)

editor=(
    "$editorDir/neovim.sh"
)

tools=(
    "$toolsDir/curl.sh"
    "$toolsDir/wget.sh"
    "$toolsDir/fd.sh"
    "$toolsDir/bat.sh"
    "$toolsDir/lsd.sh"
    "$toolsDir/zoxide.sh"
    "$toolsDir/fzf.sh"
    "$toolsDir/lazygit.sh"
    "$toolsDir/githubCLI.sh"
    "$toolsDir/node_npm.sh"
    "$toolsDir/yazi.sh"
    "$toolsDir/silicon.sh"
)

fonts=(
    "$fontsDir/jetBrainsMono.sh"
)

terminal=(
    "$terminalDir/kitty.sh"
    "$terminalDir/ohmyposh.sh"
)

shell=(
    "$shellDir/zsh.sh"
    "$shellDir/default.sh"
    "$shellDir/ohmyzsh.sh"
)

shellExtras=(
    "$shellPluginsDir/autosuggestions.sh"
    "$shellPluginsDir/syntax-highlighting.sh"
    "$shellPluginsDir/fzf-tab.sh"
)
