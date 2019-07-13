#!/bin/bash

install_alacritty() {
    local VERSION="0.3.0"
    local FILENAME="Alacritty-${VERSION}_amd64.deb"
    local URL="https://github.com/jwilm/alacritty/releases/download/v${VERSION}/${FILENAME}"

    ext_package_install alacritty $VERSION $URL
}

install_alacritty
