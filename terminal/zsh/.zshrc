#=====> ZSH <=====#
# space between last command and input prompt
function preexec() {
  __last_command="$1"
  __command_ran=1
}

function precmd() {
  if [[ $__command_ran == 1 && $__last_command != clear && $__last_command != reset ]]; then
    print
  fi

  unset __command_ran
  unset __last_command
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
setopt hist_ignore_space
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
