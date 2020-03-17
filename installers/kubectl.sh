#!/bin/bash

if [ ! -f "$BIN_DIR/kubectl" ]; then
    version=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)
    wget -q --show-progress  \
        https://storage.googleapis.com/kubernetes-release/release/$version/bin/linux/amd64/kubectl \
        -O "$BIN_DIR/kubectl" && chmod +x "$BIN_DIR/kubectl"
    chmod +x "$BIN_DIR/kubectl"
    kubectl completion bash | sudo tee /etc/bash_completion.d/kubectl > /dev/null
fi
