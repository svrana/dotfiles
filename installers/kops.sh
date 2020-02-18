#!/bin/bash

if [ ! -f "$BIN_DIR/kops" ]; then
    version=$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)
    wget -O kops "https://github.com/kubernetes/kops/releases/download/$version/kops-linux-amd64" -O "$BIN_DIR/kops" && chmod +x "$BIN_DIR/kops"
fi
