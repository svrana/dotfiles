#!/bin/bash

install() {
    local dest="$APPS/qutebrowser"
    if [ ! -d "$dest" ]; then
        git clone https://github.com/qutebrowser/qutebrowser.git "$APPS/qutebrowser"
        pushd "$dest"
        tox -e mkvenv-pypi
        ./scripts/asciidoc2html.py
        popd
    fi
    ln -sf "$DOTFILES/misc/qutebrowser.desktop" "$HOME/.local/share/applications/qutebrowser.desktop"
}

install
