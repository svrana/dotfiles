#!/bin/bash

export LS_DFLT_ARGS="-hN --color=auto --group-directories-first"

alias ls="ls \$LS_DFLT_ARGS"

#
# ls long listing
#
alias ll='ls -al'

#
# ls directories
#
alias lsd='ls -d */'

#
# ls directories long mode
#
alias lsdl='ll -d */'

#
# ls hidden
#
function lsh() {
    ll | awk '{print $9}' | grep '^\.'
}

alias p='pushd'
alias P='popd'
