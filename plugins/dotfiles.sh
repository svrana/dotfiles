#!/bin/bash

# source bashrc with ctrl-b (ctrl-v ctrl-b)
[ ! -z "$PS1" ] && bind '"":"source ~/.bashrc && direnv reload > /dev/null 2>&1\n"'

alias cdd='cd $DOTFILES'
alias cvi='vi $DOTFILES'


#
# Load a dotfiles plugin into editor
#
vip() {
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

#
# Load a dotfiles installer into editor
#
vii() {
    [ -z "$1" ] && return
    local installer="${1%.sh}"
    local installer_path

    installer_path=$DOTFILES/installers/${installer}.sh
    $EDITOR "$installer_path"
}
