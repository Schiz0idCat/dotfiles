#=====> ZSH <=====#
function precmd() {
  if [[ -n "$__ZSH_PROMPT_STARTED" ]]; then
    echo
  fi
  __ZSH_PROMPT_STARTED=true
}

zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':fzf-tab:complete:cd:*' fzf-preview '/usr/bin/lsd --color=always $realpath'

#=====> OH MY ZSH <=====#
plugins=(
	git
	sudo
	copyfile
    fzf-tab
	zsh-syntax-highlighting
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

#=====> OHMYPOSH <=====#
eval "$(oh-my-posh init zsh --config $HOME/dotfiles/terminal/ohmyposh/ohmyposhrc.toml)"

#=====> HISTORY <=====#
[ -d "$XDG_STATE_HOME/zsh" ] || mkdir -p "$XDG_STATE_HOME/zsh"

bindkey '^k' history-search-backward
bindkey '^j' history-search-forward

HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space # it doesn't work, fix it later
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

#=====> COMPLETION <=====#
[ -d "$XDG_CACHE_HOME/zsh" ] || mkdir -p "$XDG_CACHE_HOME/zsh"
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"

#=====> FZF <=====#
eval "$(fzf --zsh)"

#=====> ZOXIDE <=====#
eval "$(zoxide init --cmd cd zsh)"
