function ls
    command ls -N --color=auto --group-directories-first $argv
end

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

# Misc stuff
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

function nb
    command newsboat $argv
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
    command sox $argv[1] -p compand 0.3,1 6:-70,-60,-20 -5 -90 0.2 > $argv[2].wav
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

function cinfo
    set has_non_flag 0

    # Check if any argument is NOT a flag (doesn't start with '-')
    for arg in $argv
        if not string match -qr '^-' -- $arg
            set has_non_flag 1
            break
        end
    end

    # Run with --offline
    cargo info --offline $argv

    # Fallback only if offline failed AND a non-flag argument was passed
    if test $status -ne 0; and test $has_non_flag -eq 1
        cargo info $argv
    end
end

function cdocpub
    cargo doc $argv; or begin
        return 1
    end

    rm -rf "$DOWNLOAD_DIR/doc"

    cp -vR "target/doc" "$DOWNLOAD_DIR/" ; or begin
        return 1
    end
end

function cdoc
    cdocpub --all-features --document-private-items $argv
end
