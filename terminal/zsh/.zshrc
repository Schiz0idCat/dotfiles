#=====> ZSH <=====#
export PATH="$HOME/.local/bin:$PATH"

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
export ZSH="$HOME/.oh-my-zsh"

plugins=(
	git
	sudo
	copyfile
	zsh-syntax-highlighting
	zsh-autosuggestions
    fzf-tab
)

source $ZSH/oh-my-zsh.sh

#=====> OHMYPOSH <=====#
eval "$(oh-my-posh init zsh --config $HOME/dotfiles/terminal/ohmyposh/ohmyposhrc.toml)"


#=====> GENERAL <=====#
export EDITOR='nvim'

# XDG standard - URL:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export PATH="$CARGO_HOME/bin:$PATH"

export CUPS_CONFIG_DIR="$XDG_CONFIG_HOME/cups"
export CUPS_CACHE_DIR="$XDG_CACHE_HOME/cups"
export CUPS_DATA_DIR="$XDG_DATA_HOME/cups"

export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"
export GOPATH="$XDG_DATA_HOME"/go
export GOMODCACHE="$XDG_CACHE_HOME"/go/mod

export MAVEN_OPTS="-Dmaven.repo.local=$XDG_DATA_HOME/maven/repository"
export MAVEN_ARGS="--settings $XDG_CONFIG_HOME/maven/settings.xml"

export PATH=$PATH:$HOME/.config/spicetify
export SPICETIFY_CONFIG_HOME="$HOME/.config/spicetify"

[ -d "$XDG_STATE_HOME/zsh" ] || mkdir -p "$XDG_STATE_HOME/zsh"
HISTFILE="$XDG_STATE_HOME/zsh/.zsh_history"

[ -d "$XDG_CACHE_HOME/zsh" ] || mkdir -p "$XDG_CACHE_HOME/zsh"
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"

compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"

#=====> HISTORY <=====#
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

export HISTFILE

#=====> FZF <=====#
eval "$(fzf --zsh)"

source <(fzf --zsh)

export FZF_CTRL_T_COMMAND='fd --type f'
export FZF_CTRL_T_OPTS='
  --preview "batcat --color=always --style=numbers {}"
  --height=70%
  --style full
  --bind "result:transform-list-label:\
    if [[ - \$FZF_QUERY ]]; then \
      echo \" \$FZF_MATCH_COUNT items \"; \
    else \
      echo \" \$FZF_MATCH_COUNT matches for [\$FZF_QUERY] \"; \
    fi"
  --bind "focus:transform-preview-label:[[ -n {} ]] && printf \" %s \" {}"
  --bind "focus:+transform-header:file --brief {} || echo \"No file selected\""
  --bind "ctrl-r:change-list-label( Reloading the list )+reload(sleep 2; git ls-files)"
  --color "border:#aaaaaa,label:#cccccc"
  --color "preview-border:#e6c87c,preview-label:#fff0b3"
  --color "list-border:#669966,list-label:#99cc99"
  --color "input-border:#996666,input-label:#ffcccc"
  --color "header-border:#6699cc,header-label:#99ccff"'
export FZF_CTRL_R_OPTS='
  --reverse
  --height=70%
  --prompt="Hist > "
  --header="󰙅  Search in the commands history"
  --info=inline
  --color="prompt:#ffcc00,pointer:#ffcc00"
  --color="marker:#6699cc,spinner:#cc9966"
  --color="fg+:#ffffff,bg+:#333333"
  --color="header:#99ccff,header-label:#99ccff"
  --color="preview-border:#e6c87c,preview-label:#fff0b3"
  --color="input-border:#996666,input-label:#ffcccc"
  --bind "change:top"
  --bind "ctrl-d:toggle-sort"
  --bind "ctrl-r:reload(sleep 1; history -n)"'
export FZF_ALT_C_OPTS='
  --reverse
  --height=70%
  --prompt="Dir > "
  --header="  Select a directory"
  --info=inline
  --preview "/usr/bin/lsd --color=always -a {}"
  --preview-window=right:50%
  --color="prompt:#ffcc00,pointer:#ffcc00"
  --color="marker:#ffcc00,spinner:#cc9966"
  --color="fg+:#ffffff,bg+:#333333"
  --color="header:#99ccff,header-label:#99ccff"
  --color="preview-border:#e6c87c,preview-label:#fff0b3"
  --color="input-border:#996666,input-label:#ffcccc"
  --bind "change:top"'

#=====> ZOXIDE <=====#
eval "$(zoxide init --cmd cd zsh)"
