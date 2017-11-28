#!/bin/bash

export GOPATH="$HOME/go"
export GOROOT=/usr/local/go

[ ! -d "$GOPATH" ] && mkdir "$GOPATH"

alias gopath='echo -e ${GOPATH//:/\\n}'

PATH_append $GOPATH/bin:$GOROOT/bin

function __install_golang() {
    [ -d $GOROOT ] && return 0

    local version=1.9.2
    local url=https://storage.googleapis.com/golang
    local filename=go${version}.linux-amd64.tar.gz

    wget "${url}/${filename}" -O "$DOWNLOADS/$filename"
    sudo tar -C /usr/local -xzf "$DOWNLOADS/$filename" && \
        rm "$DOWNLOADS/$filename"
}

function __dotfiles_go_install() {
    __install_golang

    dep_version=0.3.2
    dep_url="https://github.com/golang/dep/releases/download/v$dep_version/dep-linux-amd64"
    if [ ! -f ~/.local/bin/dep ]; then
        wget ${dep_url} -O ~/.local/bin/dep
        chmod +x ~/.local/bin/dep
    fi
}
