#!/bin/bash

alias cd..='cd ..'
alias ..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'


#export CDP_DIR_SPEC="$HOME/Projects:3;$HOME/go/src/github.com:2"
export CDP_DIR_SPEC="$GOPATH/src/github.com:2;$HOME/Projects:3"
export CDP_DEFAULT_VAR="GRUF_PROJECT"
export CDP_PROJECT_VAR="PROJECTS"
source "$PROJECTS/cdp/cdp.sh"
