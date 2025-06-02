#!/bin/bash

lenguagesDir="dependencies/lenguages"
editorDir="dependencies/editor"
toolsDir="dependencies/tools"
fontsDir="dependencies/fonts"
terminalDir="dependencies/terminal"
shellDir="dependencies/shell"
shellPluginsDir="$shellDir/plugins"
wmDir="dependencies/wm"
grubDir="dependencies/grub"
socialDir="dependencies/social"

lenguages=(
    "$lenguagesDir/gcc.sh"
)

editor=(
    "$editorDir/neovim.sh"
)

tools=(
    "$toolsDir/brightnessctl.sh"
    "$toolsDir/unzip.sh"
    "$toolsDir/curl.sh"
    "$toolsDir/wget.sh"
    "$toolsDir/fd.sh"
    "$toolsDir/bat.sh"
    "$toolsDir/lsd.sh"
    "$toolsDir/zoxide.sh"
    "$toolsDir/fzf.sh"
    "$toolsDir/lazygit.sh"
    "$toolsDir/githubCLI.sh"
    "$toolsDir/npm.sh"
    "$toolsDir/yazi.sh"
    "$toolsDir/imagemagick.sh"
    "$toolsDir/fastfetch.sh"
    "$toolsDir/btop.sh"
    "$toolsDir/spotify-player.sh"
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

wm=(
    "$wmDir/hyprland.sh"
    "$wmDir/cursor.sh"
    "$wmDir/dolphin.sh"
    "$wmDir/hypridle.sh"
    "$wmDir/hyprpaper.sh"
    "$wmDir/hyprshot.sh"
    "$wmDir/hyprsunset.sh"
    "$wmDir/swaync.sh"
    "$wmDir/wl-clipboard.sh"
    "$wmDir/qt.sh"
    "$wmDir/sddm.sh"
    "$wmDir/hypr-portal.sh"
)

other=(
    "$grubDir/grub.sh"
)

social=(
    "$socialDir/spotify.sh"
    "$socialDir/discord.sh"
)
