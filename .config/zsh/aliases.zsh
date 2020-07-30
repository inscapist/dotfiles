alias ..="cd .."
alias ...="cd ../.."

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
alias batt="battery"
alias ls="exa"
alias la='exa -lbhHigUmuSa --git --color-scale'
alias genrand="openssl rand -hex 32"
alias no="$HOME/n/bin/n"
alias np="npx"
alias you="rm -f ~/.config/mps-youtube/cache_py_3.8.1; mpsyt"
alias lg="lazygit"
alias pi="pipenv"
alias pis="pipenv shell"
alias doom-cache-clear="rm -rf ~/.emacs.d/.local/cache/*"
alias gowork="cd $GOWORK"
alias pom="podman-machine"

# aws aliases
alias ec2-list="aws ec2 describe-instances | jq '[.Reservations | .[] | .Instances | .[] | {InstanceId: .InstanceId, State: .State, SubnetId: .SubnetId, VpcId: .VpcId, IamInstanceProfile: .IamInstanceProfile, Name: (.Tags[]|select(.Key==\"Name\")|.Value)}]'"
alias ec2-sess="aws ssm start-session --target" # https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html#install-plugin-macos

# aws profiles
alias jin="export AWS_PROFILE=jindesign"
