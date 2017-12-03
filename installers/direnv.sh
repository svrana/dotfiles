#!/bin/bash

mkdir -p ~/.config/direnv
ln -sf "${RCS}/direnvrc"  ~/.config/direnv/direnvrc

if [ ! -d "$GOPATH/src/github.com/direnv" ]; then
    go get -u github.com/direnv/direnv
    cd "$GOPATH/src/github.com/direnv/direnv"
    make && sudo make install
fi
