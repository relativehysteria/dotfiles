if status is-interactive
    # Show the current date
    date '+%Y-%m-%d %A %H:%M'

    # Prompt with colors and bold text
    function fish_prompt
        set -l user_color (set_color --bold green)
        set -l at_color (set_color cyan)
        set -l host_color (set_color yellow)
        set -l path_color (set_color magenta)
        set -l bracket_color (set_color red)
        set -l git_info_color (set_color green)
        set -l prompt_symbol (set_color magenta)

        # Set colors based on hostname
        if test (cat /etc/hostname) = "andromeda"
            set user_color (set_color --bold yellow)
            set at_color (set_color green)
            set host_color (set_color cyan)
        end

        # Git info
        set git_branch " "(git branch --show-current ^/dev/null)" "

        # Build the prompt
        echo -n $user_color(whoami)$at_color@$host_color(hostname)" "
        echo -n $bracket_color'['$path_color(prompt_pwd)$bracket_color']'
        echo -n $git_info_color$git_branch
        echo -n $prompt_symbol'$ '
    end

    function fish_right_prompt
        set -l exit_status_color (set_color --bold red)

        if test $status -ne 0
            echo -n $exit_status_color $status
        end
    end

    # Completion
    set -g fish_complete_path $fish_complete_path $XDG_CONFIG_HOME/fish/completions

    # Vi mode
    fish_vi_key_bindings
end

set -U fish_greeting

# Substitutions
set -x XDG_DATA_HOME "$HOME/.local/share"
set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_CACHE_HOME "$HOME/.cache"
set -x XDG_DATA_DIRS /usr/share

# Directories
set -x SCRIPTDIR "$HOME/documents/code/scripts"
set -x DOWNLOAD_DIR "$HOME/.local/share/downloads"
set -x SANDBOX "$XDG_DATA_HOME/sandbox"
set -x PACKAGES "$HOME/documents/code/packages"
set -x TOOLS "$PACKAGES/tools/"
set -x DOTNET_ROOT "$XDG_DATA_HOME/dnet"

# Default programs
set -x EDITOR "nvim"
set -x TERMINAL "st"
set -x BROWSER "firefox"
set -x SHELL "fish"
set -x READER "zathura"
set -x WM "bspwm"

# Home clean up
set -x LESSHISTFILE "-"
set -x XAUTHORITY "$XDG_RUNTIME_DIR/Xauthority"
set -x ZDOTDIR "$XDG_CONFIG_HOME/zsh"
set -x GNUPGHOME "$XDG_DATA_HOME/gnupg"

# Pass
set -x PASSWORD_STORE_DIR "$XDG_DATA_HOME/password_database"
set -x PASSWORD_STORE_CLIP_TIME "20"
set -x PASSWORD_STORE_GENERATED_LENGTH "128"

# Other stuff
set -x PATH "$SCRIPTDIR" "$HOME/.local/bin" "$CARGO_HOME/bin" $PATH
set -x VAGRANT_DEFAULT_PROVIDER "libvirt"

# Start the WM (Window Manager)
if test (tty) = "/dev/tty1"
    and not pgrep -q Xorg
        $SCRIPTDIR/cleanallcache
        exec startx "$XDG_CONFIG_HOME/X11/xinitrc"
end
