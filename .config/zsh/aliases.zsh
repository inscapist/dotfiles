# to recompile zinit, simply
# zinit update -s
# where -s = snippets

alias ..="cd .."
alias ...="cd ../.."

alias a="aws"
# alias c="cabal"
alias c="clj"
alias e="emacs -nw"
alias d="dua"
alias f="fd"
alias g="git"
alias j="z"
alias h="hoogle"
alias k="kubectl"
alias l="exa -lbF --git"
alias m="make"
alias n="nvim"
alias p="python"
alias s="stack"
alias t="tmux"
alias y="yarn"

alias di="dua interactive"
alias gp="git pull"
alias gf="git fetch"
alias la='exa -la --git --color-scale'
alias lg="lazygit"
alias ls="exa"
alias mu="multipass"
alias np='nix-env -f "<nixpkgs>"'
alias ns="nix-shell"
alias po="poetry"
alias ss="rg"

alias batt="battery"
alias cdd="cd ~/Desktop"
alias ccat="/bin/cat"
alias cat="bat"
alias cask="brew install --cask"
alias genrand="openssl rand -hex 32"
alias lls="/bin/ls"
alias sha="npx shadow-cljs"
alias yya="yarn global add"
alias ya="yarn add"
alias zap="brew uninstall --cask --zap"
alias pip="python -m pip"
alias ports="sudo lsof -PiTCP -sTCP:LISTEN"

# postgresql
alias pg-start="launchctl load ~/Library/LaunchAgents"
alias pg-stop="launchctl unload ~/Library/LaunchAgents"

alias doom-cache-clear="rm -rf ~/.emacs.d/.local/cache/*"
alias dns-clear="sudo killall -HUP mDNSResponder;sudo dscacheutil -flushcache"
alias reset-multipass="ps -ef | grep -i multipass | awk '{print "sudo kill -9 "$2}' | sh"

# aws aliases
alias ec2-list="aws ec2 describe-instances | jq '[.Reservations | .[] | .Instances | .[] | {InstanceId: .InstanceId, State: .State, SubnetId: .SubnetId, VpcId: .VpcId, IamInstanceProfile: .IamInstanceProfile, Name: (.Tags[]|select(.Key==\"Name\")|.Value)}]'"
alias ec2-sess="aws ssm start-session --target" # https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html#install-plugin-macos

# FZF
fo() {
  IFS=$'\n' out=("$(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)")
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    open "$file"
    # [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
}
