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
        set git_branch " "(git branch --show-current ^/dev/null 2>/dev/null)" "
        if test -z "$git_branch"
            set git_branch " "(git rev-parse --short HEAD 2>/dev/null)" "
        end

        # Build the prompt
        echo -n $user_color(whoami)$at_color@$host_color(hostname)" "
        echo -n $bracket_color'['$path_color(prompt_pwd)$bracket_color']'
        echo -n $git_info_color$git_branch
        echo -n $prompt_symbol'$ '
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
set -x DOWNLOAD_DIR "$HOME/.local/share/downloads/firefox"
set -x SANDBOX "$XDG_DATA_HOME/sandbox"
set -x PACKAGES "$HOME/documents/code/packages"
set -x TOOLS "$PACKAGES/tools/"
set -x DOTNET_ROOT "$XDG_DATA_HOME/dnet"

# Default programs
set -x EDITOR "nvim"
set -x TERMINAL "foot"
set -x BROWSER "firefox"
set -x SHELL "fish"
set -x READER "zathura"

# Home clean up
set -x LESSHISTFILE "-"
set -x GNUPGHOME "$XDG_DATA_HOME/gnupg"

# Rust
set -x CARGO_HOME "/opt/rust/cargo"
set -x RUSTUP_HOME "/opt/rust/rustup"

# Pass
set -x PASSWORD_STORE_DIR "$XDG_DATA_HOME/password_database"
set -x PASSWORD_STORE_CLIP_TIME "20"
set -x PASSWORD_STORE_GENERATED_LENGTH "128"

# Set up PATH
set -Ue PATH
set -x PATH "$SCRIPTDIR" "$HOME/.local/bin" $PATH

# Start the WM (Window Manager)
if test (tty) = "/dev/tty1"
    $SCRIPTDIR/cleanallcache
    exec sway
end
