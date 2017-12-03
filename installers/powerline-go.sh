#!/bin/bash

if [ ! -d "$GOPATH/src/github.com/svrana/powerline-go" ]; then
    go get -u github.com/svrana/powerline-go
    pushd "$GOPATH/src/github.com/svrana/powerline-go"
    go install
    popd
    ln -sf "$GOPATH/src/github.com/svrana/powerline-go" "$HOME/Projects/powerline-go"
fi
