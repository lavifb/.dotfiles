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

#zsh-completions
# source $HOME/.zfunc/comp.init.zsh
# autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

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

function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/[☢]}/(main|viins)/}"
    RPS2=$RPS1
    zle reset-prompt
    zle -R
}
zle -N zle-line-init
zle -N zle-keymap-select
# export KEYTIMEOUT=1

export PATH="$PATH:$HOME/.utils" # Add my own shell scripts
export PATH="$PATH:$HOME/miniconda3/bin" # Add anaconda

# zprof
