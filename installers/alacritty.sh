#!/bin/bash

function install_alacritty() {
    if [ ! -d "$APPS/alacritty" ]; then
        git clone https://github.com/jwilm/alacritty "$APPS/alacritty"
        pushd "$APPS/alacritty"
        cargo install cargo-deb
        cargo deb --install
        popd
    fi
}

function link_alacritty_config() {
    local hostname_config="$DOTFILES/rcs/alacritty.$HOSTNAME.yml"
    if [ -f "$hostname_config" ]; then
        ln -sf "$hostname_config" ~/.config/alacritty/alacritty.yml
    else
        ln -sf "$DOTFILES/rcs/alacritty.yml" ~/.config/alacritty/alacritty.yml
    fi
}

install_alacritty
link_alacritty_config
