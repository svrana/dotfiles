#!/bin/bash

command -v vg >/dev/null 2>&1 && eval "$(vg eval --shell bash)"

__dotfiles_virtualgo_install() {
    if ! which vg > /dev/null ; then
        go get -u github.com/GetStream/vg
    fi
}
