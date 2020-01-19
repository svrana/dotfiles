#!/bin/bash

install_alacritty() {
    local VERSION="0.4.1"
    local URL="https://github.com/jwilm/alacritty/releases/download/v${VERSION}/Alacritty-v${VERSION}-ubuntu_18_04_amd64.deb"
    ext_package_install alacritty $VERSION $URL
}

install_alacritty
