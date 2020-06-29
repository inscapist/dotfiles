# ============================================================================
# Options
# In the order of `man zshoptions`
# ============================================================================

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zhistory

# history
setopt append_history                 # append instead of overwrite file
setopt extended_history               # extended timestamps
setopt hist_ignore_dups
setopt hist_ignore_space              # omit from history if space prefixed
setopt hist_reduce_blanks
setopt hist_verify                    # verify when using history cmds/params

# others
setopt interactive_comments
setopt complete_aliases
setopt prompt_subst



# ============================================================================
# Alias
# ============================================================================

alias ..="cd .."
alias .2="cd ../.."

alias a="aws"
alias e="emacs -nw"
alias f="fd"
alias g="git"
alias j="z"
alias l="exa -lbF --git"
alias n="nvim"
alias p="python"
alias s="rg"
alias t="tmux"
alias y="yarn"

alias cdd="cd ~/Desktop"
alias cat="bat"
alias ls="exa"
alias la='exa -lbhHigUmuSa --git --color-scale'
alias genrand="openssl rand -hex 32"
alias csv="xsv"
alias no="/usr/local/bin/n"
alias np="npx"
alias you="rm -f ~/.config/mps-youtube/cache_py_3.8.1; mpsyt"
alias lg="lazygit"
alias goo="googler"
alias gowork="cd $GOWORK"
alias ip="ipython"
alias pi="pipenv"
alias pis="pipenv shell"
alias gc="gcloud"
alias doom-cache-clear="rm -rf ~/.emacs.d/.local/cache/*"
alias pom="podman-machine"
alias podman="podman-remote-darwin"
alias docker="podman-remote-darwin"

# aws aliases
alias ec2-list="aws ec2 describe-instances | jq '[.Reservations | .[] | .Instances | .[] | {InstanceId: .InstanceId, State: .State, SubnetId: .SubnetId, VpcId: .VpcId, IamInstanceProfile: .IamInstanceProfile, Name: (.Tags[]|select(.Key==\"Name\")|.Value)}]'"
alias ec2-sess="aws ssm start-session --target" # https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html#install-plugin-macos

# aws profiles
alias jin="export AWS_PROFILE=jindesign"



# ============================================================================
# Keybindings
# ============================================================================

# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html
# use zle -l to show available widgets
export KEYTIMEOUT=1
bindkey -v
bindkey '^R' fzf-history-widget
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^K' kill-line
bindkey '^W' backward-kill-word
bindkey -s '^o' 'nvim $(fzf)\n' # open a fzf-found file
bindkey -M vicmd '^[' vi-insert # escape from vi-mode



# ============================================================================
# Conditional eval scripts
# ============================================================================

(( $+commands[starship] )) && eval "$(starship init zsh)"
(( $+commands[podman-machine] )) && eval $(podman-machine env --varlink)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# autoload -Uz compinit
# compinit
# autoload bashcompinit && bashcompinit
# complete -o nospace -C /usr/local/bin/terraform terraform
# complete -C '/usr/local/bin/aws_completer' aws



# ============================================================================
# Plugins
# ============================================================================

# ----------------------------------------------------------------------------
# Added by Zinit's installer
if [[ ! -f $HOME/.config/zsh/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.config/zsh/.zinit" && command chmod g-rwX "$HOME/.config/zsh/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.config/zsh/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.config/zsh/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

# End of Zinit's installer chunk
# ----------------------------------------------------------------------------

zinit light agkozak/zsh-z

zinit ice silent has'pyenv' wait'!1'
zinit snippet OMZ::plugins/pyenv

zinit ice silent has'rbenv' wait'!1'
zinit snippet OMZ::plugins/rbenv

zinit ice silent has'aws' wait
zinit snippet OMZ::plugins/aws

zinit wait lucid as'completion' is-snippet for \
    'https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker' \
    'https://github.com/docker/compose/blob/master/contrib/completion/zsh/_docker-compose' \
    'https://github.com/containers/libpod/blob/master/completions/zsh/_podman'

zinit wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" \
      zdharma/fast-syntax-highlighting \
  blockf atpull'zinit creinstall -q .' \
      zsh-users/zsh-completions \

