#!/bin/bash

# solarized ls colors
#
location=~/.config/dircolors
[ -f "$location" ] && eval "$(dircolors $location)"

function __dotfiles_dircolors_install() {
    ln -sf "${DOTFILES_DIR}/misc/dircolors.ansi-dark" ~/.config/dircolors
}
unset location
