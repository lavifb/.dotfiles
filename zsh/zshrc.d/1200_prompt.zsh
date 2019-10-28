# Zsh Prompt

autoload -Uz vcs_info

zstyle ':vcs_info:*' stagedstr '%F{2}●'
zstyle ':vcs_info:*' unstagedstr '%F{1}●'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{136}%r'
zstyle ':vcs_info:*' enable git svn
precmd () {
    # check for untracked files in git
    if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
        zstyle ':vcs_info:*' formats ' [%F{yellow}%b%c%u%f]'
    } else {
        zstyle ':vcs_info:*' formats ' [%F{yellow}%b%c%u%F{5}●%f]'
    }

    vcs_info
}

setopt prompt_subst
PROMPT='%B%F{yellow}%n%f:%F{blue}%1~%f%b${vcs_info_msg_0_} %(?/%F{white}/%F{red})∮ %f'

# To indicate vi mode
VI_PROMPT="%F{green}[NORMAL]%f"


# Show when in vi NORMAL mode
function zle-line-init zle-keymap-select {
    zle reset-prompt
    zle -R
}

# Redraw prompt when window is resized
TRAPWINCH() {
    zle && { zle reset-prompt; zle -R }
}

function vi_mode_indicator {
    echo "${${KEYMAP/vicmd/$VI_PROMPT}/(main|viins)/}"
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

RPROMPT='$(vi_mode_indicator)'