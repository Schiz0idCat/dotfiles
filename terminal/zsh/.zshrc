export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.local/bin:$PATH"

plugins=(
	git
	sudo
	copyfile
	zsh-syntax-highlighting
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

eval "$(oh-my-posh init zsh --config $HOME/dotfiles/terminal/ohmyposh/ohmyposhrc.toml)"

function precmd() {
  if [[ -n "$__ZSH_PROMPT_STARTED" ]]; then
    echo
  fi
  __ZSH_PROMPT_STARTED=true
}

bindkey '^k' history-search-backward
bindkey '^j' history-search-forward

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
