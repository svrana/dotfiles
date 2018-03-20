#!/bin/bash

alias cd..='cd ..'
alias ..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'


export CDP_DIR_SPEC="$HOME/Projects:3;$GOPATH/src/github.com:2"
export CDP_DEFAULT_VAR="GRUF_PROJECT"
source "$PROJECTS/cdp/cdp.sh"
