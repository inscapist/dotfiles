#!/bin/sh

cd "$HOME" || return
mkdir -p ~/.config
ln -sfn ~/dotfiles/.zshenv ~/.zshenv
ln -sfn ~/dotfiles/.config/starship.toml ~/.config/starship.toml
ln -sfn ~/dotfiles/.config/alacritty ~/.config/alacritty
ln -sfn ~/dotfiles/.config/nixpkgs ~/.config/nixpkgs
ln -sfn ~/dotfiles/.config/nvim ~/.config/nvim
ln -sfn ~/dotfiles/.config/zsh ~/.config/zsh
ln -sfn ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sfn ~/dotfiles/.skhdrc ~/.skhdrc
ln -sfn ~/dotfiles/.yabairc ~/.yabairc
ln -sfn ~/dotfiles/.doom.d ~/.doom.d
touch .config/zsh/secrets.zsh

# this is blank, should be made a separate repository
mkdir -p ~/org/roam
mkdir -p ~/org/gtd
mkdir -p ~/org/notes
mkdir -p ~/org/elfeed.org

# install tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# git
# ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -sfn ~/dotfiles/.gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global 

