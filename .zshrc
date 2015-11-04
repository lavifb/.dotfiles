#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#	Modified for use by Lavi Blumberg <lavifb@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# move the zsh-help
unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help

# put casks in /Applications
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

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

# fix nvim correct
alias nvim='nocorrect nvim'

# python3
alias py3='python3'

export PATH="$PATH:$HOME/.utils" # Add my own shell scripts
