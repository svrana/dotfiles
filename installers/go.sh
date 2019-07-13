#!/bin/bash

GOROOT=${GOROOT:-/usr/local/go}
GOPATH=${GOPATH:-$HOME/go}

function __install_golang() {
    [ -d "$GOROOT" ] && return 0

    local version=1.12.5
    local url=https://storage.googleapis.com/golang
    local filename=go${version}.linux-amd64.tar.gz

    wget "${url}/${filename}" -O "$DOWNLOADS/$filename"
    sudo tar -C /usr/local -xzf "$DOWNLOADS/$filename" && \
        rm "$DOWNLOADS/$filename"

    source "$DOTFILES/plugins/go.sh"
}

function __dotfiles_go_install() {
    __install_golang

    local dep_version=0.5.3
    local dep_url="https://github.com/golang/dep/releases/download/v$dep_version/dep-linux-amd64"
    if [ ! -f ~/.local/bin/dep ]; then
        wget ${dep_url} -O ~/.local/bin/dep
        chmod +x ~/.local/bin/dep
    fi

    if [ ! -f "$GOPATH/bin/gopls" ]; then
        "$GOROOT/bin/go" get -u golang.org/x/tools/cmd/gopls
    fi

    if [ ! -f "$GOPATH/bin/golint" ]; then
        "$GOROOT/bin/go" get -u golang.org/x/lint/golint
    fi
}

__dotfiles_go_install
