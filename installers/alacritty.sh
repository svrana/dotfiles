#!/bin/bash

function install_alacritty() {
    local VERSION="v0.3.0"
    local FILENAME="Alacritty-${VERSION}_amd64.deb"
    local URL="https://github.com/jwilm/alacritty/releases/download/${VERSION}/${FILENAME}"

    if [ ! -f "$APPS/$FILENAME" ]; then
        curl -L -sSf -o "$APPS/$FILENAME" "$URL"
        sudo dpkg -i "$APPS/$FILENAME"
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
