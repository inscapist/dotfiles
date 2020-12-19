```
____________________________________________________
                     _____      __   ______     __
                     /    )   /    )   /      /    )
---_--_-------------/----/---/----/---/-------\-----
  / /  ) /   /     /    /   /    /   /         \
_/_/__/_(___/_____/____/___(____/___/______(____/___
           /
       (_ /
```

Feel free to open an issue if you need clarification to my configs.

![Screenshot](screenshot.png)

## What's in the box?

- Somewhat heavily configurated [Emacs config](.doom.d) based on [Doom](https://github.com/hlissner/doom-emacs)
  - Org-Roam (aka Roam Research on Emacs)
  - Elfeed (RSS feed reader)
  - Working example of [Org Agenda](.doom.d/+org.el) configuration
  - Opinionated [keybindings](.doom.d/+bindings.el). J and K would scroll, S would save buffer
- Simple and quick [Neovim config](.config/nvim)
- A working tiling window manager configuration for Mac (with [yabai](.yabairc))
- Minimal mouse dependency with [skhd](.skhdrc)
- Embedded [floating window](.config/nvim/modules/floating-window) in Vim, see [screenshot](screenshot-vim-modal.png)
- Seamless integration between [tmux](.tmux.conf), [vim](bin/isvim2) and [alacritty](.config/alacritty)
- [Shows](bin/whats-playing) currently played Spotify song
- Customized command prompt with [starship](.config/starship.toml)
- Modularized [zsh config](.config/zsh) with the demonstration of [Zinit](https://github.com/zdharma/zinit) async syntax
- An earthy theme ported from [Miramare](https://github.com/franbach/miramare)

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

Sensitive environment variables should not be version controlled, they are placed in `secrets.zsh`.

### Install Emacs

Pick any distro that you like.

1. [Emacs Mac Port (recommended)](https://github.com/railwaycat/homebrew-emacsmacport)
2. [Emacs Plus](https://github.com/d12frosted/homebrew-emacs-plus)
3. [GccEmacs](https://github.com/twlz0ne/nix-gccemacs-darwin)

Read [here](https://www.emacswiki.org/emacs/GccEmacs) about GccEmacs

### Install doom emacs

https://github.com/hlissner/doom-emacs

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

* `nix-env -iA nixpkgs.<package-name>` installs a package with exact match
* `nix-env -q` shows installed packages
* `nix-env --uninstall <installed-package>` uninstalls package


```sh
# install Nix and cachix, follow the instructions
curl -L https://nixos.org/nix/install | sh

nix-channel --update

# includes python, yarn, nodejs
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
curl https://bootstrap.pypa.io/get-pip.py | python
pip install black pyflakes isort nose pytest pipenv

# others via yarn
yarn global add marked
yarn global add stylelint prettier js-beautify

# others via brew
brew install cliclick starship yabai shkd gh
```

## Configuration

### Emacs Font Smoothing
```sh
# default = -int 1
defaults write org.gnu.Emacs AppleFontSmoothing -int 0
```
