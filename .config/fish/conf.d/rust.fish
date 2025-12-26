set -x CARGO_HOME "/opt/rust/cargo"
set -x RUSTUP_HOME "/opt/rust/rustup"

[ -f "/opt/rust/cargo/env.fish" ] && source "/opt/rust/cargo/env.fish"

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
    cargo info -v --offline $argv

    # Fallback only if offline failed AND a non-flag argument was passed
    if test $status -ne 0; and test $has_non_flag -eq 1
        cargo info -v $argv
    end
end


function cdocpub
    cargo doc $argv; or return 1

    if not set -q DOWNLOAD_DIR
        echo "DOWNLOAD_DIR not set"
        return 1
    end

    set out_dir "$DOWNLOAD_DIR/doc"

    mkdir -p "$out_dir"
    rsync -a --delete "target/doc/" "$out_dir/" ; or return 1

    set project (cargo metadata --no-deps --format-version 1 \
        | jq -r '
            .workspace_members[0] as $root
            | .packages[]
            | select(.id == $root)
            | .name
        ')
    echo "<head><meta http-equiv='refresh' content='0;url=$project/index.html'></head>" > "$out_dir/doc.html"
end


function cdoc
    cdocpub --all-features --document-private-items $argv
end
