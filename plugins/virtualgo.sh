#!/bin/bash

command -v vg >/dev/null 2>&1 && eval "$(vg eval --shell bash)"

__dotfiles_install_virtualgo() {
    if ! which vg ; then
        go get -u github.com/GetStream/vg
    fi
}
