#
# Executes commands at the start of an interactive session.
#
# Authors:
#	Lavi Blumberg <lavifb@gmail.com>
#

######################
# ZPLUG
export ZPLUG_HOME=~/.zplug
source $ZPLUG_HOME/init.zsh

#if ! $ZPLUG_CACHE_CLEAN; then
    zplug "zsh-users/zsh-completions", defer:2

    zplug "zsh-users/zsh-syntax-highlighting", defer:3

    zplug 'esc/conda-zsh-completion', defer:2

    zplug 'srijanshetty/zsh-pip-completion', defer:2

    zplug 'zplug/zplug', hook-build:'zplug --self-manage', defer:2

#fi

# ask to install uninstalled plugins
#if ! zplug check --verbose; then
#    printf "Install? [y/N]: "
#    if read -q; then
#        echo; zplug install
#    fi
#fi

zplug load
# END ZPLUG
######################

######################
# PROMPT
autoload -Uz vcs_info

zstyle ':vcs_info:*' stagedstr '%F{34}●'
zstyle ':vcs_info:*' unstagedstr '%F{136}●'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{136}%r'
zstyle ':vcs_info:*' enable git svn
precmd () {
    if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
        zstyle ':vcs_info:*' formats ' [%F{yellow}%b%c%u%F{blue}%f]'
    } else {
        zstyle ':vcs_info:*' formats ' [%F{yellow}%b%c%u%F{red}●%F{blue}%f]'
    }

    vcs_info
}

setopt prompt_subst
PROMPT='%F{yellow}%n%f:%F{blue}%~%f${vcs_info_msg_0_} %(?/%F{white}/%F{red})∮ %f'
# END PROMPT
######################

# ZSH COMPLETIONS
#####################
#autoload -Uz compinit && compinit -i

# Options
setopt COMPLETE_IN_WORD    # Complete from both ends of a word.
setopt ALWAYS_TO_END       # Move cursor to the end of a completed word.
setopt PATH_DIRS           # Perform path search even on command names with slashes.
setopt AUTO_MENU           # Show completion menu on a successive tab press.
setopt AUTO_LIST           # Automatically list choices on ambiguous completion.
setopt AUTO_PARAM_SLASH    # If completed parameter is a directory, add a trailing slash.

# Case-insensitive (all), partial-word, and then substring completion.
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Group matches and describe.
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

# Don't complete unavailable commands.
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'

# Cache completions
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "${HOME}/.zcompcache"

# History
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' meanu yes

# END COMPLETIONS
####################

alias ..='cd ..'
alias cask='brew cask'
alias rm='rm -i'

alias gcm='git commit -m'
alias gam='git commit -am'
alias gc='git commit'
alias gp='git push'
alias gll='git pull'
alias gr='git reset'
alias ghh='git reset HEAD --hard'
alias gs='git status'
alias gch='git checkout'
alias gmr='git merge'
alias gb='git branch'

# fix nvim correct
alias nvim='nocorrect nvim'

# python3
alias py3='python3'

# vim shortcuts in shell
bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

# turn on colors for ls
export CLICOLOR=1

# fix base-16 colors
~/.zscripts/base16-tomorrow-night.sh

# Show when in vi NORMAL mode# Show when in vi NORMAL mode# Show when in vi NORMAL mode
#precmd() { RPROMPT="" }
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%F{green}[NORMAL]%f"
    RPROMPT="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}"
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

export PATH="$PATH:$HOME/.utils" # Add my own shell scripts
export PATH="$PATH:$HOME/miniconda3/bin" # Add anaconda

