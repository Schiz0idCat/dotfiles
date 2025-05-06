#!/bin/bash

lenguagesDir="dependencies/lenguages"
editorDir="dependencies/editor"
editorExtrasDir="$editorDir/extras"
toolsDir="dependencies/tools"
fontsDir="dependencies/fonts"
terminalDir="dependencies/terminal"
shellDir="dependencies/shell"
shellPluginsDir="$shellDir/plugins"

lenguages=(
    "$lenguagesDir/rust.sh"
)

editor=(
    "$editorDir/neovim.sh"
    "$editorDir/nvchad.sh"
)

editorExtras=(
    "$editorExtrasDir/bashls.sh"
)

tools=(
    "$toolsDir/curl.sh"
    "$toolsDir/bat.sh"
    "$toolsDir/lsd.sh"
    "$toolsDir/node_npm.sh"
    "$toolsDir/silicon.sh"
)

fonts=(
    "$fontsDir/jetBrainsMono.sh"
)

terminal=(
    "$terminalDir/kitty.sh"
)

shell=(
    "$shellDir/zsh.sh"
    "$shellDir/default.sh"
    "$shellDir/ohmyzsh.sh"
)

shellExtras=(
    "$shellPluginsDir/autosuggestions.sh"
    "$shellPluginsDir/syntax-highlighting.sh"
)
