#!/usr/bin/env bash

main() {
    if [ ! -d "$APPS/spotifyd" ]; then
        git clone https://github.com/Spotifyd/spotifyd.git "$APPS/spotifyd"
        pushd "$APPS/spotifyd"
        if cargo build --release ; then
            cp target/release/spotifyd "$HOME/.local/bin"
        fi
        popd
    fi

    if [ ! -d "$APPS/spotify-tui" ]; then
        git clone https://github.com/Rigellute/spotify-tui.git "$APPS/spotify-tui"
        pushd "$APPS/spotify-tui"
        cargo install spotify-tui
        popd
    fi
}

if [ -d "$TRAVIS" ]; then
    echo "Skipping spotifyd and spotify-tui builds on Travis"
else
    main
fi
