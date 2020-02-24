#!/bin/bash

install() {
    local dest="$APPS/qutebrowser"
    if [ ! -d "$dest" ]; then
        sudo apt-get install asciidoc -y --no-install-recommends
        git clone https://github.com/qutebrowser/qutebrowser.git "$APPS/qutebrowser"
        pushd "$dest"
        python3 scripts/mkvenv.py
        .venv/bin/python3 scripts/asciidoc2html.py
        .venv/bin/python3 scripts/dev/update_3rdparty.py
        popd
    fi
    ln -sf "$DOTFILES/misc/qutebrowser.desktop" "$HOME/.local/share/applications/qutebrowser.desktop"
}

install
