#!/bin/bash

[ -d "$APPS/gruf" ] && . "$APPS/gruf/gruf.sh"

function __dotfiles_gruf_install() {
    if [ ! -d "$APPS/gruf" ]; then
        git clone https://github.com/svrana/gruf.git "$APPS/gruf"
        estatus "Cloned gruf"
    fi
}
