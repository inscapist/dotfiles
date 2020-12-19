#!/bin/sh

cd "$HOME" || return
mkdir -p ~/.config
ln -sfn ~/dotfiles/.zshenv ~/.zshenv
ln -sfn ~/dotfiles/.config/starship.toml ~/.config/starship.toml
ln -sfn ~/dotfiles/.config/alacritty ~/.config/alacritty
ln -sfn ~/dotfiles/.config/nixpkgs ~/.config/nixpkgs
ln -sfn ~/dotfiles/.config/nvim ~/.config/nvim
ln -sfn ~/dotfiles/.config/zsh ~/.config/zsh
ln -sfn ~/dotfiles/.ctags.d ~/.ctags.d
ln -sfn ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sfn ~/dotfiles/.skhdrc ~/.skhdrc
ln -sfn ~/dotfiles/.yabairc ~/.yabairc
ln -sfn ~/dotfiles/.doom.d ~/.doom.d
touch .config/zsh/secrets.zsh

# install tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# git
# ln -s ~/dotfiles/.gitconfig ~/.gitconfig
# ln -s ~/dotfiles/.gitignore_global ~/.gitignore_global

# mkdir -p ~/Library/Application\ Support/ptpython
# ln -s ~/dotfiles/.ptpython/config.py ~/Library/Application\ Support/ptpython/config.py
