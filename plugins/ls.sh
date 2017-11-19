#!/bin/bash

export LS_DFLT_ARGS="--color=auto"

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

#
# ls links (short listing)
#
function lsl() {
    lsll | gawk '{print $9}'
}

alias p='pushd'
alias P='popd'
