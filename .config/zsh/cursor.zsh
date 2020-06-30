# Change cursor shape for different vi modes.
BLOCK='\e[1 q'
BEAM='\e[5 q'


### Init
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne $BEAM
}
zle -N zle-line-init

echo -ne $BEAM                  # Use beam shape cursor on startup.
preexec() { echo -ne $BEAM ;}   # Use beam shape cursor for each new prompt.


### OnKeyMap
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne $BLOCK
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne $BEAM
  fi

  # == starship specific stanza ==
  starship_render
  zle reset-prompt
  # == starship specific stanza ==
}
zle -N zle-keymap-select
