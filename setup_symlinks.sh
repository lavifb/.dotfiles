#!/bin/bash

export DOTHOME="$( cd "$( dirname "$0" )" && pwd )"

echo "Setting up symlinks..."

# zsh
ln -sf $DOTHOME/zsh/zlogin $HOME/.zlogin
ln -sf $DOTHOME/zsh/zlogout $HOME/.zlogout
ln -sf $DOTHOME/zsh/zprofile $HOME/.zprofile
ln -sf $DOTHOME/zsh/zshenv $HOME/.zshenv
ln -sf $DOTHOME/zsh/zshrc $HOME/.zshrc

ln -sfh $DOTHOME/zsh/zscripts $HOME/.zscripts
ln -sfh $DOTHOME/zsh/zshrc.d $HOME/.zshrc.d

# vim
ln -sf  $DOTHOME/vim/init.vim $HOME/.vimrc
ln -sfh $DOTHOME/vim/autoload $HOME/.vim/autoload
ln -sfh $DOTHOME/vim/colors $HOME/.vim/colors

# neovim
ln -sfh $DOTHOME/vim $HOME/.config/nvim

# git
ln -sf $DOTHOME/git/gitconfig $HOME/.gitconfig
ln -sf $DOTHOME/git/gitignore $HOME/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

# tmux
ln -sf $DOTHOME/tmux/tmux.conf $HOME/.tmux.conf
ln -sf $DOTHOME/tmux/tmux-osx.conf $HOME/.tmux/tmux-osx.conf

echo "Done setting up symlinks."
