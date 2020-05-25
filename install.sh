#!/bin/sh

# editor and terminal
mkdir ~/.config
ln -s ~/dotfiles/.config/alacritty ~/.config/alacritty
ln -s ~/dotfiles/.config/nvim ~/.config/nvim
ln -s ~/dotfiles/.ctags.d ~/.ctags.d
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

# git
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.gitignore_global ~/.gitignore_global
