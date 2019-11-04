#!/bin/bash

function __dotfiles_install_k8s_tools() {
    if [ ! -d "$APPS/kubectx" ]; then
        git clone https://github.com/ahmetb/kubectx "$APPS/kubectx"
        ln -sf "$APPS/kubectx/kubectx" "$BIN_DIR/kubectx"
        ln -sf "$APPS/kubectx/kubens" "$BIN_DIR/kubens"
    fi


    if [ ! -f "$BIN_DIR/kubectl" ]; then
        version=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)
        wget -q --show-progress  \
            https://storage.googleapis.com/kubernetes-release/release/$version/bin/linux/amd64/kubectl \
            -O "$BIN_DIR/kubectl" && chmod +x "$BIN_DIR/kubectl"
        chmod +x "$BIN_DIR/kubectl"
    fi

    if [ ! -f "$BIN_DIR/kops" ]; then
        local version
        version=$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)
        wget -O kops "https://github.com/kubernetes/kops/releases/download/$version/kops-linux-amd64" -O "$BIN_DIR/kops" && chmod +x "$BIN_DIR/kops"
    fi
}

__dotfiles_install_k8s_tools
