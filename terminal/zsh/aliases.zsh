#=====> cat <=====#
alias cat='batcat'

#=====> ls <=====#
alias ls='lsd'
alias ll='lsd -l'
alias la='lsd -a'
alias lla='lsd -la'
alias lt='lsd --tree'
alias ltl='lsd --tree -l'
alias lta='lsd --tree -a'
alias ltla='lsd --tree -la'

#=====> browser <=====#
alias brave='brave-browser'

#=====> fzf <=====#
alias fzf="fzf --reverse --style full \
    --preview 'batcat --color=always --style=numbers {}' \
    --bind \"result:transform-list-label:\
        if [[ - \$FZF_QUERY ]]; then \
          echo ' \$FZF_MATCH_COUNT items '; \
        else \
          echo ' \$FZF_MATCH_COUNT matches for [\$FZF_QUERY] '; \
        fi\" \
    --bind \"focus:transform-preview-label:[[ -n {} ]] && printf ' %s ' {}\" \
    --bind \"focus:+transform-header:file --brief {} || echo 'No file selected'\" \
    --bind \"ctrl-r:change-list-label( Reloading the list )+reload(sleep 2; git ls-files)\" \
    --color 'border:#aaaaaa,label:#cccccc' \
    --color 'preview-border:#e6c87c,preview-label:#fff0b3' \
    --color 'list-border:#669966,list-label:#99cc99' \
    --color 'input-border:#996666,input-label:#ffcccc' \
    --color 'header-border:#6699cc,header-label:#99ccff'"

#=====> editor <=====#
alias fnvim='selection=$(find $HOME -type f | fzf -m); [ -n "$selection" ] && nvim $selection'

#=====> cd <=====#
alias fcd='selection=$(find "$HOME" -type d | fzf --no-preview --preview "lsd -l --color=always --blocks permission,user,group,name {}"); [ -n "$selection" ] && cd "$selection"'

#=====> git <=====#
alias lgit='lazygit'
