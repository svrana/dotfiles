#!/bin/bash

__install_joplin() {
    local version="1.0.63"
    local filename="Joplin-${version}-x86_64.AppImage"
    local dest_filename="joplin.AppImage"
    local dest_path="$HOME/.local/bin/${dest_filename}"
    local url="https://github.com/laurent22/joplin/releases/download/v${version}/${filename}"

    if [ ! -f "$dest_path" ]; then
        wget ${url} -O "$dest_path"
        chmod +x "$dest_path"
    fi
}

__install_joplin
