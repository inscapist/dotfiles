#!/bin/sh

# editor and terminal
mkdir -p ~/.config
ln -s ~/dotfiles/.zshenv ~/.zshenv
ln -s ~/dotfiles/.config/zsh ~/.config/zsh
ln -s ~/dotfiles/.config/starship.toml ~/.config/starship.toml
ln -s ~/dotfiles/.config/alacritty ~/.config/alacritty
ln -s ~/dotfiles/.config/nvim ~/.config/nvim
ln -s ~/dotfiles/.ctags.d ~/.ctags.d
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.skhdrc ~/.skhdrc
ln -s ~/dotfiles/.yabairc ~/.yabairc
ln -s ~/dotfiles/.doom.d ~/.doom.d

# git
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.gitignore_global ~/.gitignore_global

mkdir -p ~/Library/Application\ Support/ptpython
ln -s ~/dotfiles/.ptpython/config.py ~/Library/Application\ Support/ptpython/config.py

# install basic brew packages
brew install openssl coreutils
brew install git tmux zsh starship
brew install exa bat rg fd
brew install glances jq fx htop httpie tree gpg graphviz tig lazygit pwgen
brew install pyenv rbenv ruby-build awscli terraform

# install tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# install node
curl -L https://git.io/n-install | bash

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

