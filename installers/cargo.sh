#!/bin/bash

if [ ! -d "$HOME/.cargo/bin" ]; then
    echo
    curl -sSf -o "$DOWNLOADS/rustup.sh" https://sh.rustup.rs
    sh "$DOWNLOADS/rustup.sh" -y --no-modify-path
    rm "$DOWNLOADS/rustup.sh"
    "$HOME/.cargo/bin/rustup" update
fi
