#!/bin/bash

export GOPATH="$HOME/go"
export GOROOT=/usr/local/go
PATH_append "$GOPATH/bin:$GOROOT/bin"

[ ! -d "$GOPATH" ] && mkdir "$GOPATH"

alias gopath='echo -e ${GOPATH//:/\\n}'
