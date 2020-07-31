# https://www.reddit.com/r/zsh/comments/e882c4/what_is_the_difference_between_zshrc_and_zprofile/

#=======================================================================
# Generic environment
#=======================================================================
export BROWSER='open'
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

path=(
  /usr/local/{bin,sbin}
  $path
)

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi
