#!/bin/bash

if [ ! -d "$APPS/kubectx" ]; then
    git clone https://github.com/ahmetb/kubectx "$APPS/kubectx"
    ln -sf "$APPS/kubectx/kubectx" "$BIN_DIR/kubectx"
    ln -sf "$APPS/kubectx/kubens" "$BIN_DIR/kubens"
fi
