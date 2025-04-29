export ZSH="$HOME/.oh-my-zsh"

plugins=(
	git
	sudo
	copyfile
	zsh-syntax-highlighting
	zsh-autosuggestions
	)

source $ZSH/oh-my-zsh.sh

eval "$(oh-my-posh init zsh --config $HOME/dotfiles/terminal/ohmyposh/ohmyposhrc.toml)"
