#!/bin/bash

# source bashrc with F7
[ ! -z "$PS1" ] && bind '"\e[18~":"source ~/.bashrc && direnv reload > /dev/null 2>&1\n"'

alias cdd='cd $DOTFILES'
alias cvi='vi $DOTFILES'
