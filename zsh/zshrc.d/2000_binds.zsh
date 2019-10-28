# Terminal keybindings

# vim shortcuts in shell
bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
bindkey '^a' beginning-of-line
bindkey '^6' beginning-of-line # for tmux
bindkey '^e' end-of-line
bindkey '^4' end-of-line # for tmux

# bind keys to get home/end keys to work
bindkey "^[[3~" delete-char
bindkey "^[[H"  beginning-of-line
bindkey "^[[1~" beginning-of-line # for tmux
bindkey "^[[F"  end-of-line
bindkey "^[[4~" end-of-line       # for tmux
bindkey "^[[5~" up-line-or-search
bindkey "^[[6~" down-line-or-search