#!/bin/bash

function __install_standard_notes() {
    local version=3.0.25
    local filename="Standard-Notes-${version}.AppImage"
    local dest="$BIN_DIR/$filename"

    if [ ! -f "$dest" ]; then
        local url="https://github.com/standardnotes/desktop/releases/download/v${version}/$filename"
        wget "${url}" -O "$dest" && chmod +x "$dest"
        ln -sf "$dest" "$BIN_DIR/standard-notes"
    fi
}

__install_standard_notes
