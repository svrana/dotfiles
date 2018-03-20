#!/bin/bash

alias cd..='cd ..'
alias ..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'


export CDP_DIR_SPEC="$HOME/Projects:2;$GOPATH/src/github.com:3"
export CDP_DEFAULT_VAR="GRUF_PROJECT"
source "$PROJECTS/cdp/cdp.sh"
