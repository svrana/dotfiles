#!/bin/bash

mkdir -p ~/.config/direnv
ln -sf "${RCS}/direnvrc"  ~/.config/direnv/direnvrc

if [ ! -d "$GOPATH/src/github.com/direnv" ]; then
    go get -u github.com/direnv/direnv
    pushd "$GOPATH/src/github.com/direnv/direnv"
    go install
    popd
fi
