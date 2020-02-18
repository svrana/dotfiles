#!/bin/bash

if [ ! -f "$BIN_DIR/k9s" ]; then
    git clone https://github.com/derailed/k9s "$APPS/k9s"
    pushd "$APPS/k9s" > /dev/null
    make build && ln -sf "$APPS/k9s/execs/k9s" "$BIN_DIR/k9s"
    popd > /dev/null
fi

