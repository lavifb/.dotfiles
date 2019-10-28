# Aliases

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias rm='rm -i'

if which git >/dev/null 2>&1 ; then
	alias gcm='git commit -m'
	alias gam='git commit -am'
	alias gc='git commit'
	alias gp='git push'
	alias gpo='git push origin'
	alias gll='git pull'
	alias gr='git reset'
	alias ghh='git reset HEAD --hard'
	alias gs='git status'
	alias gch='git checkout'
	alias gmr='git merge'
	alias gb='git branch'
	alias gd='git diff'
	alias glg='git log --graph --pretty=oneline --abbrev-commit'
	alias gf='git fetch'
fi

# fix nvim correct
if which nvim >/dev/null 2>&1 ; then
	alias nvim='nocorrect nvim'
	alias vim='nocorrect nvim'
fi

# use lldb without sandbox
if which /Applications/Xcode.app/Contents/Developer/usr/bin/lldb >/dev/null 2>&1 ; then
	alias lldb='/Applications/Xcode.app/Contents/Developer/usr/bin/lldb'
fi

# bat instead of cat
if which bat >/dev/null 2>&1 ; then
	alias cat='bat'
fi

if which brew >/dev/null 2>&1 ; then
	alias cask='brew cask'
fi

if which kubectl >/dev/null 2>&1 ; then
	alias k='kubectl'
fi
