#!/bin/bash

function __dotfiles_install_k8s_tools() {
    if [ ! -d "$APPS/kubectx" ]; then
        git clone https://github.com/ahmetb/kubectx "$APPS/kubectx"
        ln -sf "$APPS/kubectx/kubectx" "$BIN_DIR/kubectx"
        ln -sf "$APPS/kubectx/kubens" "$BIN_DIR/kubens"
    fi


    if [ ! -f "$BIN_DIR/kubectl" ]; then
        wget -q --show-progress  \
            https://storage.googleapis.com/kubernetes-release/release/v1.10.4/bin/linux/amd64/kubectl \
            -O "$BIN_DIR/kubectl"
        chmod +x "$BIN_DIR/kubectl"
    fi

}

__dotfiles_install_k8s_tools
