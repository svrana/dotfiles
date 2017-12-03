#!/bin/bash

export GOPATH="$HOME/go"
export GOROOT=/usr/local/go
PATH_append "$GOPATH/bin:$GOROOT/bin"

[ ! -d "$GOPATH" ] && mkdir "$GOPATH"

alias gopath='echo -e ${GOPATH//:/\\n}'

function cdg() {
    [ -z "$1" ] && echo "Must specify a project" && return
    local project="$1"
    cd "$(fd --max-depth 3 "$project" "$HOME/go/src")"
}
