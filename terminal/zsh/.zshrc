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
