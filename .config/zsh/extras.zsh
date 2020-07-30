# (( $+commands[podman-machine] )) && eval $(podman-machine env --varlink)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
complete -C '/usr/local/bin/aws_completer' aws

