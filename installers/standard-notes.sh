#!/bin/bash

function __install_standard_notes() {
    [ -d "$GOROOT" ] && return 0

    local version=2.3.7
    local filename="standard-notes-${version}-x86_64.AppImage"
    local url="https://github.com/standardnotes/desktop/releases/download/v${version}/$filename"

    wget "${url}/${filename}" -O "$APPS/$filename" && chmod +x "$APPS/$filename"
}

__install_standard_notes
