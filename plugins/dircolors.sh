#!/bin/bash

# solarized ls colors
#
location=~/.config/dircolors
[ -f "$location" ] && eval "$(dircolors $location)"
unset location

function __dotfiles_dircolors_install() {
    ln -sf "${DOTFILES}/misc/dircolors.ansi-dark" ~/.config/dircolors
}
