# Show the current date
date '+%Y-%m-%d %A %H:%M'

# Disable the 'kill' and 'r' builtins
disable kill
disable r
disable suspend

# Prompt
autoload -Uz vcs_info
autoload -U colors && colors
setopt prompt_subst

precmd() {
    vcs_info
}

# Default colors
PS1="%B%{$fg[green]%}%n%{$fg[cyan]%}@%{$fg[yellow]%}%M"

# Colors for home computer
if [ "$(cat /etc/hostname)" = "andromeda" ]; then
    PS1="%B%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[cyan]%}%M"
fi

PS1="$PS1 %{$fg[red]%}[%{$fg[magenta]%}%~%{$fg[red]%}]"
PS1="$PS1%b%{$fg[green]%}\$vcs_info_msg_0_"
PS1="$PS1%{$reset_color%}%B%{$fg[magenta]%}$ %b"
RPS1="%B%{$fg[red]%}%?"

# Load aliases
[ -f "$XDG_CONFIG_HOME/aliasrc" ] && source "$XDG_CONFIG_HOME/aliasrc"

# Completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
# Include hidden files in autocompletion
_comp_options+=(globdots)

# Vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab completion menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# Everything below this line doesn't function correctly on login shells
# so we'll just have to return here
[[ -o login ]] && return

# Change cursor shape for different vi modes
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

zle-line-init() {
    # Initiate `vi insert` as keymap
    # (can be removed if `bindkey -V` has been set elsewhere)
    zle -K viins
    echo -ne "\e[5 q"
}
zle
