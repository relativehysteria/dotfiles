#!/bin/zsh

# Substitutions
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_DIRS=/usr/share

# Directories
export SCRIPTDIR="$HOME/documents/code/scripts"
export DOWNLOAD_DIR="$HOME/.local/share/downloads"
export SANDBOX="$XDG_DATA_HOME/sandbox"
export FILEZILLA_DIR="$SANDBOX/filezilla"
export GHIDRA_DIR="$SANDBOX/ghidra"
export PACKAGES="$HOME/documents/code/packages"
export TOOLS="$PACKAGES/tools/"
export DOTNET_ROOT="$XDG_DATA_HOME/dnet"

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
export VAGRANT_HOME="$XDG_DATA_HOME/vagrant"
export VAGRANT_ALIAS_FILE="$XDG_DATA_HOME/vagrant/aliases"

# Pass
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password_database"
export PASSWORD_STORE_CLIP_TIME="20"
export PASSWORD_STORE_GENERATED_LENGTH="128"

# zsh stuff
export HISTSIZE="10000"
export SAVEHIST="$HISTSIZE"
export HISTFILE="$XDG_CACHE_HOME/zsh_history"
export TIMEFMT=$'real\t%E\nuser\t%U\nkernel\t%S'

# Other stuff
export PATH="$SCRIPTDIR:$HOME/.local/bin:$CARGO_HOME/bin:$PATH"
export VAGRANT_DEFAULT_PROVIDER=libvirt

# Start the WM
[ "$(tty)" = "/dev/tty1" ] \
	&& ! ps -e | grep -qw Xorg \
	&& $SCRIPTDIR/cleanallcache \
	&& exec startx "$XDG_CONFIG_HOME/X11/xinitrc"
