#!/bin/zsh

# Substitutions
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

# Directories
export SCRIPTDIR="$HOME/documents/code/scripts"
export DOWNLOAD_DIR="$HOME/.local/share/downloads"
export SANDBOX="$XDG_DATA_HOME/sandbox"
export FILEZILLA_DIR="$SANDBOX/filezilla"
export GHIDRA_DIR="$SANDBOX/ghidra"
export SECLISTS="$HOME/documents/code/packages/SecLists"

# Default programs
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"
export SHELL="zsh"
export READER="zathura"
export WM="bspwm"

# Home clean up
export LESSHISTFILE="-"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GEM_HOME="$XDG_DATA_HOME/gem"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"

# Pass
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password_database"
export PASSWORD_STORE_CLIP_TIME="20"
export PASSWORD_STORE_GENERATED_LENGTH="128"

# zsh stuff
export HISTSIZE="10000"
export SAVEHIST="$HISTSIZE"
export HISTFILE="$XDG_CACHE_HOME/zsh_history"
export TIMEFMT=$'real\t%E\nuser\t%U\nkernel\t%S'

export PATH="$SCRIPTDIR:$HOME/.local/bin:$CARGO_HOME/bin:$PATH"

# Start the WM
[ "$(tty)" = "/dev/tty1" ] \
	&& ! ps -e | grep -qw Xorg \
	&& $SCRIPTDIR/cleanallcache \
	&& exec startx "$XDG_CONFIG_HOME/X11/xinitrc"
