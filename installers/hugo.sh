#!/bin/bash

if [ ! -d "$APPS/hugo" ]; then
    git clone https://github.com/gohugoio/hugo.git "$APPS/hugo"
    pushd "$APPS/hugo"
    go install --tags extended
    popd
fi
