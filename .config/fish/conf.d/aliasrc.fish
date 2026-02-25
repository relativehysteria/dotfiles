function grep
    command grep --color=auto $argv
end

function diff
    command diff --color=auto $argv
end

# Verbosity levels
function cp
    command cp -v $argv
end

function mv
    command mv -v $argv
end

function rm
    command rm -v $argv
end

function tar
    command tar -v $argv
end

function pstree
    command pstree -aclptU $argv
end

function ydl
    command yt-dlp --output '%(title)s.%(ext)s' $argv
end

function gdb
    command gdb -nh -x "$XDG_CONFIG_HOME/gdb/init" $argv
end

function ncm
    command ncmpcpp $argv
end

function objdump
    command objdump -C -M intel $argv
end

function nmap
    command nmap --system-dns $argv
end

function ss
    command ss -lntpa $argv
end

function compand
    command sox $argv[1] -p compand 0.3,1 6:-70,-60,-20 -5 -90 0.2
        \ > $argv[2].wav
end

function find
    command fd $argv
end

function lines
    command tokei $argv
end

function clang
    command clang -fdiagnostics-color=always $argv
end

function readelf
    command readelf -WC $argv
end

function cdbase
    set search_targets "Cargo.toml" ".git"

    for target in $search_targets
        set dir (pwd)
        while test "$dir" != "/"
            if test -e "$dir/$target"
                cd "$dir"
                return 0
            end
            set dir (dirname "$dir")
        end
    end

    return 1
end

function git
    command git $argv

    # If first argument is "push"
    if test (count $argv) -gt 0; and test $argv[1] = push
        # Capture exit status
        set status_code $status

        # Only run rg if push succeeded
        if test $status_code -eq 0
            echo
            rg --no-heading --line-number --color=always '\b(TODO|XXX)\b' .
        end

        return $status_code
    end
end
