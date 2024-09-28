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
    command objdump -M intel $argv
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


function cdoc
    command cargo doc
    rm -rf $DOWNLOAD_DIR/firefox/doc/
    mv target/*/doc $DOWNLOAD_DIR/firefox/
end
