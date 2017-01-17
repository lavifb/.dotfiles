#!/bin/bash

export DOTHOME=$(pwd)

echo "Setting up symlinks..."

# zsh
ln -sf $DOTHOME/zsh/zlogin $HOME/.zlogin
ln -sf $DOTHOME/zsh/zlogout $HOME/.zlogout
ln -sf $DOTHOME/zsh/zprofile $HOME/.zprofile
ln -sf $DOTHOME/zsh/zshenv $HOME/.zshenv
ln -sf $DOTHOME/zsh/zshrc $HOME/.zshrc

ln -sfh $DOTHOME/zsh/zscripts $HOME/.zscripts

# vim
ln -sf $DOTHOME/vim/init.vim $HOME/.vimrc
ln -sf $DOTHOME/vim/autoload $HOME/.vim/autoload
ln -sf $DOTHOME/vim/colors $HOME/.vim/colors

# neovim
ln -sfh $DOTHOME/vim $HOME/.config/nvim

# git
ln -sf $DOTHOME/git/gitconfig $HOME/.gitconfig

# tmux
ln -sf $DOTHOME/tmux/tmux.conf $HOME/.tmux.conf

echo "Done setting up symlinks."
