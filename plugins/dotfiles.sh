#!/bin/bash

# source bashrc with F7
[ ! -z "$PS1" ] && bind '"\e[18~":"source ~/.bashrc && direnv reload > /dev/null 2>&1\n"'

alias cdd='cd $DOTFILES_DIR'
alias cvi='vi $DOTFILES_DIR'

function plugin() {
    local path_request=false

    if [ $# -gt 1 ]; then
        if [ "$1" == "--path" ]; then
            path_request=true
            shift 1
        fi
    fi
    local name="$1"
    if [ -z "$name" ]; then
        echo "Missing plugin name"
        return 1
    fi

    local location="$DOTFILES_DIR/plugins/${name}.sh"
    if [ ! -f "$location" ]; then
        echo "Plugin $name does not exist"
        return 1
    fi

    if [ "$path_request" = true ]; then
        echo "$location"
    else
        echo -n "Activating $name plugin"
        source "$location"
        estatus
    fi
}
