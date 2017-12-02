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
    $EDITOR $(dotfiles_plugin --path "$1")
}
