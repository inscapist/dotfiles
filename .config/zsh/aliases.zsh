alias ..="cd .."
alias ...="cd ../.."

alias a="aws"
alias c="choose"
alias e="emacs -nw"
alias f="fd"
alias g="git"
alias j="z"
alias k="kubectl"
alias l="exa -lbF --git"
alias m="multipass"
alias p="python"
alias s="rg"
alias t="tmux"
alias y="yarn"

alias cdd="cd ~/Desktop"
alias ccat="/bin/cat"
alias cat="bat"
alias batt="battery"
alias lls="/bin/ls"
alias ls="exa"
alias la='exa -lbhHigUmuSa --git --color-scale'
alias genrand="openssl rand -hex 32"
alias lg="lazygit"
alias po="poetry"
alias pos="poetry shell"
alias doom-cache-clear="rm -rf ~/.emacs.d/.local/cache/*"
alias dns-clear="sudo killall -HUP mDNSResponder;sudo dscacheutil -flushcache"

# aws aliases
alias ec2-list="aws ec2 describe-instances | jq '[.Reservations | .[] | .Instances | .[] | {InstanceId: .InstanceId, State: .State, SubnetId: .SubnetId, VpcId: .VpcId, IamInstanceProfile: .IamInstanceProfile, Name: (.Tags[]|select(.Key==\"Name\")|.Value)}]'"
alias ec2-sess="aws ssm start-session --target" # https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html#install-plugin-macos

