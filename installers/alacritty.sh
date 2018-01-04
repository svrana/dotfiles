#!/bin/bash

mkdir -p ~/.config/alacritty

ln -sf "${RCS}/alacritty.yml" ~/.config/alacritty/alacritty.yml
ln -sf "${DOTFILES}/misc/alacritty.desktop" ~/.local/share/applications

if [ ! -d "$APPS/alacritty" ]; then
    git clone https://github.com/jwilm/alacritty "$APPS/alacritty"
    pushd "$APPS/alacritty"
    rustup override set stable
    rustup update stable
    cargo build --release
    popd
fi
