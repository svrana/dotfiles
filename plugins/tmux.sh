#!/bin/bash

alias tma='tmux attach -d -t'

function tmux {
    if [[ -z "$VIRTUAL_ENV" && -z "$VIRTUALGO" ]]; then
        direnv exec / tmux
    else
        echo "Get out of virtualenv"
        return 1
    fi
}

# create named tmux session, i.e., tmux new -s dev
function tmn() {
    if [ -z "$1" ]; then
        tmux
    else
        tmux new-session -s "$1"
    fi
}
