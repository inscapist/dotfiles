#!/bin/sh

brew install bat
brew install tmux-mem-cpu-load
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
brew install jesseduffield/lazygit/lazygit
brew install tig
brew install ddgr
brew install googler
brew install ipcalc
brew install graphviz
brew install pwgen
brew install jq
brew install websocat
brew install httpie
brew install tree
brew install htop
brew install git-extras
brew install openssl
brew install git-crypt
brew install fzf
brew install rg
brew install ag
brew install gpg
brew install ruby-build
brew install bat
brew install git
brew install neovim --head

brew tap zegervdv/zathura
brew install zathura
brew install zathura-pdf-poppler
mkdir -p $(brew --prefix zathura)/lib/zathura
ln -s $(brew --prefix zathura-pdf-poppler)/libpdf-poppler.dylib $(brew --prefix zathura)/lib/zathura/libpdf-poppler.dylib

brew cask install alacritty
