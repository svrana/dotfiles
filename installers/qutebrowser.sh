#!/bin/bash

install() {
    local dest="$APPS/qutebrowser"
    if [ ! -d "$dest" ]; then
        sudo apt-get install asciidoc --no-install-recommends
        git clone https://github.com/qutebrowser/qutebrowser.git "$APPS/qutebrowser"
        if [ -z "$TRAVIS" ]; then
            pushd "$dest"
            python3 scripts/mkvenv.py
            #./scripts/asciidoc2html.py
            scripts/dev/update_3rdparty.py
            popd
        fi
    fi
    ln -sf "$DOTFILES/misc/qutebrowser.desktop" "$HOME/.local/share/applications/qutebrowser.desktop"
}

install
