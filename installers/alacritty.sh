#!/bin/bash

function install_alacritty() {
    local VERSION="0.3.0"
    local FILENAME="Alacritty-${VERSION}_amd64.deb"
    local URL="https://github.com/jwilm/alacritty/releases/download/v${VERSION}/${FILENAME}"

    ext_package_install alacritty $VERSION $URL
}

function link_alacritty_config() {
    local hostname_config="${RCS}/alacritty.$HOSTNAME.yml"
    if [ -f "$hostname_config" ]; then
        ln -sf "$hostname_config" ~/.config/alacritty/alacritty.yml
    else
        ln -sf "$DOTFILES/rcs/alacritty.yml" ~/.config/alacritty/alacritty.yml
    fi
}

install_alacritty
link_alacritty_config
