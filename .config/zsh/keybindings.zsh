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
# Vi Cursor
# ============================================================================

# Change cursor shape for different vi modes.
BLOCK='\e[1 q'
BEAM='\e[5 q'


### Init
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne $BEAM
}
zle -N zle-line-init


### OnKeyMap
function zle-keymap-select {
  if [[ $KEYMAP == vicmd ]] || [[ $1 = 'block' ]]; then
    echo -ne $BLOCK
  elif [[ $KEYMAP == main ]] || [[ $KEYMAP == viins ]] ||
       [[ $KEYMAP = '' ]] || [[ $1 = 'beam' ]]; then
    echo -ne $BEAM
  fi

  # == starship specific stanza ==
  starship_render
  zle reset-prompt
  # == starship specific stanza ==
}
zle -N zle-keymap-select
