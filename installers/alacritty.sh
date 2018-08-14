#!/bin/bash

if [ ! -d "$APPS/alacritty" ]; then
    git clone https://github.com/jwilm/alacritty "$APPS/alacritty"
    pushd "$APPS/alacritty"
    rustup override set stable
    rustup update stable
    cargo deb --install
    popd
fi
