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

## What's special?

### Works with GccEmacs (feature/native-comp)

- Everything is so much faster. Most noticeable with frontend development (TSX/JSX)
- Ligature works out of the box (Emacs 28)

### Self-contained

- No zsh cluttering `$HOME`
- Language and version specific binaries with the use of pyenv, rbenv, `tj/n`

### Speedy

- `Zinit` is currently the fastest option out there
- Rust variants are used whenever possible: `fd`, `exa`, `rg`, `bat` etc

### Rich shell features

- Changing between vi-mode and insert-mode
- Useful information display with the help of `starship.rs`

### Ask me anything

Send me a PR to let me know what issues you find. I am hoping to turn this into a reproducible bundle, but I might overlooked some hardcoded variables.

### With interesting fonts

- For UI, I use [Megrim](https://fonts.google.com/specimen/Megrim) but [Unica One](https://fonts.google.com/specimen/Unica+One) is cool too
- For code, I use [Dank Mono](https://gumroad.com/l/dank-mono), but I like [Iosevka](https://github.com/be5invis/Iosevka) and [Ubuntu Mono](https://design.ubuntu.com/font/) as well
- For terminal, I used Monoid and currently using [JetBrains Mono](https://www.jetbrains.com/lp/mono/)

## Installation

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

```sh
# install nix and follow through with the instruction
curl -L https://nixos.org/nix/install | sh

# src: https://gist.github.com/AllenDang/f019593e65572a8e0aefc96058a2d23e
nix-env -iA cachix -f https://cachix.org/api/v1/install
cachix use gccemacs-darwin
nix-env -iA emacsGccDarwin -f https://github.com/twlz0ne/nix-gccemacs-darwin/archive/master.zip
```

Restart the system or relogin. `which emacs` should reveal the new emacs location. GUI Emacs is under `~/.nix-profile/Applications` in my case.

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

```sh
# install Nix and cachix
curl -L https://nixos.org/nix/install | sh
nix-env -iA cachix -f https://cachix.org/api/v1/install

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

# latest nodejs
nix-env -iA nixpkgs.nodejs-14_x
nix-env -iA nixpkgs.yarn

# python and pips
nix-env -iA nixpkgs.python39
nix-env -iA nixpkgs.poetry
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
pip install black pyflakes isort nose pytest pipenv

# others via nix
nix-env -iA nixpkgs.graphviz
nix-env -iA nixpkgs.shellcheck
nix-env -iA nixpkgs.proselint

# others via yarn
yarn global add marked
yarn global add stylelint prettier js-beautify
```

## Configuration

To disable font smoothing (Mac only), run

```sh
# default = -int 1
defaults write org.gnu.Emacs AppleFontSmoothing -int 0
```
