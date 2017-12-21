#!/bin/bash

# source bashrc with F7
[ ! -z "$PS1" ] && bind '"\e[18~":"source ~/.bashrc && direnv reload > /dev/null 2>&1\n"'

alias cdd='cd $DOTFILES'
alias cvi='vi $DOTFILES'


#
# Load a dotfiles plugin into editor
#
function vip() {
    [ -z "$1" ] && return
    local plugin="${1%.sh}"
    local plugin_path

    plugin_path=$(dotfiles_plugin --path "$plugin")
    if [ $? -ne 0 ]; then
        echo "$plugin_path"
        return 1
    fi

    $EDITOR "$plugin_path"
}
