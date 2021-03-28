[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)
[![zsh](https://img.shields.io/badge/Shell-zsh-yellow.svg)](.config/zsh)

<br/>

> “ We shape our tools, and thereafter our tools shape us. ”
>
> - distorted from original quote, by Marshall McLuhan

<br/>

This is my dotfiles.
Feel free to open an issue if you need clarification to my configs.

## What languages has been tested?

- LaTex
- React/Typescript with LSP
- Jsx support with rjsx-mode
- Haskell with LSP
- Python with pyright and poetry
- Elixir
- Clojure (WIP)

## What's in the box?

- Somewhat heavily configurated [Emacs config](.doom.d) based on [Doom](https://github.com/hlissner/doom-emacs)
  - Org-Roam (aka Roam Research on Emacs)
  - Elfeed (RSS feed reader)
  - Working example of [Org Agenda](.doom.d/+org.el) configuration
  - Opinionated [keybindings](.doom.d/+bindings.el). J and K would scroll, S would save buffer
- Simple and quick [Neovim config](.config/nvim)
- A working tiling window manager configuration for Mac (with [yabai](.yabairc))
- Minimal mouse dependency with [skhd](.skhdrc)
- Embedded [floating window](.config/nvim/modules/floating-window) in Vim, see [screenshot](gallery/screenshot-vim-modal.png)
- Seamless integration between [tmux](.tmux.conf), [vim](bin/isvim2) and [alacritty](.config/alacritty)
- [Shows](bin/whats-playing) currently played Spotify song
- Customized command prompt with [starship](.config/starship.toml)
- Modularized [zsh config](.config/zsh) with the demonstration of [Zinit](https://github.com/zdharma/zinit) async syntax
- An earthy theme ported from [Miramare](https://github.com/franbach/miramare)
- Highly customizable Prose linter/checker using [Vale](https://github.com/errata-ai/vale)

### Still prefer VsCode?

See here:
https://gist.github.com/sagittaros/a632a853e6e3f78c64f1b4c017217b30

## Ask me anything

Send me a PR to let me know what issues you find. I am hoping to turn this into a reproducible bundle, but I might overlooked some hardcoded variables.

## Installation

```sh
git clone https://github.com/sagittaros/dotfiles.git
cd dotfiles
./install.sh
```

### Neovim

For first time access, run the following commands in order:

```
:PlugInstall
:UpdateRemotePlugins
:checkhealth
```

### Zsh

I use [Zinit](https://github.com/zdharma/zinit) as ZSH's plugin manager. My `.zshrc` is [here](.config/zsh/.zshrc).
`$ZDOTDIR` is set in `$HOME/.zshenv`, so that zsh configs are self-contained.

- Sensitive environment variables should not be version controlled, they are placed in `$ZDOTDIR/secrets.zsh`.
- Add additional zsh scripts to the bottom of `$ZDOTDIR/.zshrc`

### Install Emacs

Pick any distro that you like.

1. [Emacs Mac Port (recommended)](https://github.com/railwaycat/homebrew-emacsmacport)
2. [Emacs Plus](https://github.com/d12frosted/homebrew-emacs-plus)
3. [GccEmacs](https://github.com/twlz0ne/nix-gccemacs-darwin)
4. [Emacs Head](https://github.com/daviderestivo/homebrew-emacs-head)

Example:

```sh
# Takes about 15 mins
brew install emacs-head@28 --with-cocoa --with-native-comp --with-modern-icon-black-dragon

# Can take up to an hour
brew install emacs-head@28 --with-cocoa --with-native-comp --with-native-full-aot --with-modern-icon-black-dragon
```

Read [here](https://www.emacswiki.org/emacs/GccEmacs) about GccEmacs

### Install doom emacs

https://github.com/hlissner/doom-emacs

```sh
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
```

after installation, run `doom doctor` to determine missing packages

### Install tiling window manager (Yabai and Skhd)

Follow the following steps to install it, require reboots and messing with `csrutil`

1. Enable `Displays have separate Spaces` under System Preferences -> Mission Control
2. Follow the instruction to disable SIP [here](https://github.com/koekeishiya/yabai/wiki/Disabling-System-Integrity-Protection)
3. Install [Yabai](<https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(latest-release)>)
4. Install [Skhd](https://github.com/koekeishiya/skhd)
5. yabai and skhd should be running in `brew services list`
6. if it doesn't work, check the error by running `tail -f /usr/local/var/log/yabai/yabai.err.log`

### Install additional packages

`basicPackages` includes a number of packages, refer [.config/nixpkgs/config.nix](.config/nixpkgs/config.nix)

Find packages at https://search.nixos.org/packages

- `nix-env -iA nixpkgs.<package-name>` installs a package with exact match
- `nix-env -q` shows installed packages
- `nix-env --uninstall <installed-package>` uninstalls package

# Extras

```sh
# Essential libraries with brew
brew install cliclick starship yabai shkd gh coreutils fontconfig
brew install vale # modern proselint

# Fzf history search
brew install fzf
$(brew --prefix)/opt/fzf/install

# Install emacs 28
brew install emacs-head@28 --with-cocoa --with-native-comp --with-native-full-aot --with-modern-icon-doom-cacodemon

# install Nix and cachix, follow the instructions
curl -L https://nixos.org/nix/install | sh

nix-channel --update

# install nix packages
nix-env -iA nixpkgs.basicPackages

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# haskell
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

# golang
nix-env -iA nixpkgs.go
go get -u github.com/motemen/gore/cmd/gore
go get -u github.com/stamblerre/gocode
go get -u golang.org/x/tools/cmd/godoc
go get -u golang.org/x/tools/cmd/goimports
go get -u golang.org/x/tools/cmd/gorename
go get -u golang.org/x/tools/cmd/guru
go get -u github.com/cweill/gotests/...
go get -u github.com/fatih/gomodifytags

# python and pips
nix-env -iA nixpkgs.python38 # or python39
curl https://bootstrap.pypa.io/get-pip.py | python
pip install black pyflakes isort nose pytest pipenv pipx
pipx install grip # for markdown preview

# others via yarn
yarn global add marked
yarn global add stylelint prettier js-beautify
yarn global add pyright

# required by org +roam
nix-env -iA nixpkgs.sqlite # it is required for org-roam to work properly

# LATEX and some fonts (See latex keybindings at the bottom of this doc)
brew install --cask mactex
brew install --cask skim # preview app
brew install latexindent
brew install --cask font-gentium-plus
brew install --cask font-tex-gyre-pagella
brew install --cask font-tex-gyre-pagella-math
```

## Configuration

### Emacs Font Smoothing

```sh
# default = -int 1
defaults write org.gnu.Emacs AppleFontSmoothing -int 0
```

## Keybindings

### Tmux + Nvim, in Alacritty

```
Cmd + H: Move to left tmux tab
Cmd + L: Move to right tmux tab
Cmd + K: Clear buffer
Cmd + n: New tab
Cmd + w: Kill tab
Cmd + e: Rename tab
Cmd + s: Rename session
Cmd + Enter: Toggle Full Screen

` + o: View all open tmux windows
` + \: Split tmux pane to the right
` + -: Split tmux pane to the bottom

Ctrl + HJKL: Move between panes (even across neovim/tmux)
```

For more, refer:

- [tmux.conf](https://github.com/sagittaros/dotfiles/blob/master/.tmux.conf)
- [alacritty.conf](https://github.com/sagittaros/dotfiles/blob/8bcd9ceb35b02d1d484aafe2adea17e42477ad19/.config/alacritty/alacritty.yml#L108)

#### ZSH

```shell
# `i` to enter vim mode
# ESC to quit vim mode

bindkey -v
bindkey '^R' fzf-history-widget # ctrl+r to search history with fzf

# emacs style 0
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^K' kill-line
bindkey '^W' backward-kill-word

# open a fzf-found file
bindkey -s '^o' 'nvim $(fzf)\n'
```

### Emacs

```emacs-lisp
(map! :nv "S" #'save-buffer
      :nv "F" #'avy-goto-char-timer
      :nv "f" #'avy-goto-char-in-line
      :nv "J" #'evil-scroll-down
      :nv "K" #'evil-scroll-up
      :nv "gx" #'browse-url
      :nv "rr" #'evil-ex-nohighlight
      :nv "rb" #'revert-bufferm
      :nv "rc" #'lsp-workspace-restart)

;; Easier navigation
(map! :ne "C-h"   #'evil-window-left
      :ne "C-l"   #'evil-window-right
      :ne "C-j"   #'evil-window-down
      :ne "C-k"   #'evil-window-up
      :ne "s-h"   #'+workspace/switch-left
      :ne "s-l"   #'+workspace/switch-right
      :ne "s-n"   #'+workspace/new
      :ne "s-w"   #'+workspace/close-window-or-workspace
      :ne "s-r"   #'+workspace/rename)

;; Easier window split
(map! :leader
      "\\" #'evil-window-vsplit
      "-" #'evil-window-split)

;; Ace window
(map! :leader "w w" #'ace-window)
```

[More here](https://github.com/sagittaros/dotfiles/blob/master/.doom.d/+bindings.el)

### [Neo]vim

```vim-snippet
# simple glucose
nnoremap <silent> rr :noh<cr>
nnoremap <silent> re :e!<cr>
nnoremap <silent> rw <C-w>=
nnoremap <silent> rf :set foldmethod=manual<CR> zE
inoremap <silent> jj <Esc>
nnoremap j gj
nnoremap k gk
vnoremap B ^
vnoremap E $
nnoremap B ^
nnoremap E $
nmap f <Plug>(easymotion-sl)
nmap F <Plug>(easymotion-s2)

# split screen
nnoremap <silent> ss :sp<CR>
nnoremap <silent> vv :vsp<CR>
nnoremap <silent> qq <C-w>q

# toggle embedded LazyGit
nnoremap <silent> <space>lg :<C-u>call ToggleLazyGit()<CR>

# quick scroll
nnoremap <silent> K :call ScrollQuarter('up')<CR>
nnoremap <silent> J :call ScrollQuarter('down')<CR>
```

[More here](https://github.com/sagittaros/dotfiles/blob/master/.config/nvim/modules/keymaps.vim)

### LaTex workflow

To compile the document, `C-c C-c` and select `LaTex` in the menu.
To preview LaTex while editing, `C-c C-v`. I use "Skim.app" for previewing

## TODO

- Write a flycheck's checker for =vale=
