#!/usr/bin/bash

install() {
    local VERSION=1.1.0
    local dest="$APPS/pass/install_host_app.sh"

    mkdir -p "$APPS/pass"
    if [ ! -f "$dest" ]; then
        wget https://github.com/passff/passff-host/releases/download/${VERSION}/install_host_app.sh -O "$dest" && chmod +x $dest
        $dest firefox
    fi
}

install
