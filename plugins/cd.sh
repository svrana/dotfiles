#!/bin/bash

alias cd..='cd ..'
alias ..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

function cdp() {
    local project="$1"

    if [ -z "$project" ]; then
        if [ -n "$GRUF_PROJECT" ]; then
            cd "$GRUF_PROJECT"
        else
            echo "Must specify directory or project name"
        fi
        return
    fi

    dir="$(fd --max-depth 2 "$project" "$PROJECTS")"
    if [ -n "$dir" ]; then
        cd "$dir"
    else
        echo "Could not find $project in \$PROJECTS directory"
    fi
}
