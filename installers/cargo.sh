#!/bin/bash

if [ ! -d "$HOME/.cargo/bin" ]; then
    echo
    download https://sh.rustup.rs "$DOWNLOADS/rustup.sh"
    sh "$DOWNLOADS/rustup.sh" -y --no-modify-path
    rm "$DOWNLOADS/rustup.sh"
    "$HOME/.cargo/bin/rustup" update
    PATH_append "$HOME/.cargo/bin" # for immediate use.. markup vim plugin uses it
fi
