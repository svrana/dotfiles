#!/bin/bash

alias tma='tmux attach -d -t'
alias tmux='deactivate 2>/dev/null 1>&2 ; direnv exec / tmux'

# create named tmux session, i.e., tmux new -s dev
function tmn() {
    if [ -z "$1" ]; then
        tmux
    else
        tmux new-session -s "$1"
    fi
}

function __dotfiles_tmux_install() {
    ln -sf "${RCS}/tmux.conf" ~/.tmux.conf

    mkdir -p ~/.tmux/plugins
    if [ ! -d ~/.tmux/plugins/tpm ]; then
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    fi

    ~/.tmux/plugins/tpm/bin/install_plugins
    ~/.tmux/plugins/tpm/bin/clean_plugins
}
