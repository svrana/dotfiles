#!/bin/bash

function __install_golang() {
    [ -d "$GOROOT" ] && return 0

    local version=1.9.4
    local url=https://storage.googleapis.com/golang
    local filename=go${version}.linux-amd64.tar.gz

    wget "${url}/${filename}" -O "$DOWNLOADS/$filename"
    sudo tar -C /usr/local -xzf "$DOWNLOADS/$filename" && \
        rm "$DOWNLOADS/$filename"
}

function __dotfiles_go_install() {
    __install_golang

    local dep_version=0.4.1
    local dep_url="https://github.com/golang/dep/releases/download/v$dep_version/dep-linux-amd64"
    if [ ! -f ~/.local/bin/dep ]; then
        wget ${dep_url} -O ~/.local/bin/dep
        chmod +x ~/.local/bin/dep
    fi
}

__dotfiles_go_install
