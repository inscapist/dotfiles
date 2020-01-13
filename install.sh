#!/bin/sh

# tmux plugins
ln -s ~/dotfiles/tmux-plugins/battery /usr/local/bin/battery
ln -s ~/dotfiles/tmux-plugins/spotify /usr/local/bin/spotify

# editor and terminal
mkdir ~/.config
ln -s ~/dotfiles/.config/alacritty ~/.config/alacritty
ln -s ~/dotfiles/.config/nvim ~/.config/nvim
ln -s ~/dotfiles/.ctags.d ~/.ctags.d
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

# git
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.gitignore ~/.gitignore
ln -s ~/dotfiles/.gitignore_global ~/.gitignore_global
