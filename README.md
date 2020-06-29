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

I am currently migrating [my vim configuration](.config/nvim) to [Doom emacs](.doom.d). 

Feel free to open an issue if you need clarification to my configs.

## Installation

### Setup zsh
I use [Zinit](https://github.com/zdharma/zinit) as ZSH's plugin manager. My `.zshrc` is [here](.config/zsh/.zshrc).
It is a good idea to source it from another `.zshrc` that lives in $HOME.

```
# $HOME/.zshrc

source $HOME/.zprofile  # sensitive stuff
export ZDOTDIR=$HOME/.config/zsh
source $ZDOTDIR/.zshrc
```

### Install latest emacs
```sh
brew tap d12frosted/emacs-plus
brew install jansson 
brew install emacs-plus@27 --with-jansson --with-no-titlebar --with-modern-icon-black-variant	
```
Now brew a coffee, because it is going to take awhile

### Install doom emacs

https://github.com/hlissner/doom-emacs

### Run install script

``` sh
# editor, feel free to cherry pick
mkdir ~/.config
ln -s ~/dotfiles/.config/alacritty ~/.config/alacritty
ln -s ~/dotfiles/.config/nvim ~/.config/nvim
ln -s ~/dotfiles/.ctags.d ~/.ctags.d
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.skhdrc ~/.skhdrc
ln -s ~/dotfiles/.yabairc ~/.yabairc

# git
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.gitignore_global ~/.gitignore_global
```

### Install tiling window manager (Yabai and Skhd)

Yabai can be quite difficult to install. Just follow the following steps to install it.

1. Enable `Displays have separate Spaces` under System Preferences -> Mission Control
2. Follow the instruction to disable SIP [here](https://github.com/koekeishiya/yabai/wiki/Disabling-System-Integrity-Protection)
3. Install [Yabai](https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(latest-release))
4. Install [Skhd](https://github.com/koekeishiya/skhd)
5. yabai and skhd should be running in `brew services list`
6. if it doesn't work, check the error by running `tail -f /usr/local/var/log/yabai/yabai.err.log`

### Setup Org Protocol 

I was using `Pocket` to bookmark webpages. This is the org equivalent

a) Add the following bookmark item (I am using [Vivaldi](https://vivaldi.com))
``` 
javascript:location.href ='org-protocol://capture?template=c&url='+   encodeURIComponent(location.href) +   '&title=' + encodeURIComponent(document.title) +   '&body=' + encodeURIComponent(window.getSelection())
```

b) Install EmacsClient (to handle org-protocol)

``` sh
brew cask install emacsclient
```

c) Inform emacsclient location using symlink

``` sh
ln -s /usr/local/bin/emacsclient /Applications/Emacs.app/Contents/MacOS/bin-x86_64-10_9/emacsclient
```


